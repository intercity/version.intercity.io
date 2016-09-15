require "test_helper"

class DailyDownloadTest < ActiveSupport::TestCase
  check_for_valid_fixtures :daily_download

  should validate_presence_of :download_date

  test "#set_download_count(day, amount) should store the download count for that day" do
    download = daily_downloads(:first_september).tap { |d| d.update(amount: 10) }

    DailyDownload.set_download_count("01/Sep/2016", 20)

    assert_equal 20, download.reload.amount
  end
end
