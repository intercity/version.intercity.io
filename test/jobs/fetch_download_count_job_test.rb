require "test_helper"

class FetchDownloadCountJobTest < ActiveJob::TestCase
  test "#perform should fetch the download count from intercity.io" do
    Download.destroy_all

    FetchDownloadCountJob.any_instance.stubs(:fetch_data).returns(fake_download_data)

    assert_difference "Download.count", 3 do
      FetchDownloadCountJob.perform_now
    end
  end

  test "#perform should fetch the download count, and update existing data" do
    Download.destroy_all

    FetchDownloadCountJob.any_instance.stubs(:fetch_data).returns(fake_download_data)

    assert_difference "Download.count", 3 do
      FetchDownloadCountJob.perform_now
    end

    assert_no_difference "Download.count" do
      FetchDownloadCountJob.perform_now
    end
  end

  private

  def fake_download_data
    File.read(Rails.root.join("test", "fixtures", "sample_data", "download_stats"))
  end
end
