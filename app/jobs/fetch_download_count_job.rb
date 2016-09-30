class FetchDownloadCountJob < ApplicationJob
  def perform
    data = fetch_data
    data.each_line do |line|
      splitted_data = line.split(" ")
      DailyDownload.set_download_count(splitted_data[1], splitted_data[0].to_i)
    end
  end

  private

  def fetch_data
    open(ENV.fetch("STATS_URL")).read
  end
end
