require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  check_for_valid_fixtures :download

  should validate_presence_of :download_date

  test "#set_download_count(day, amount) should store the download count for that day" do
    download = downloads(:first_september).tap { |d| d.update(amount: 10) }

    Download.set_download_count("01/Sep/2016", 20)

    assert_equal 20, download.reload.amount
  end
end
