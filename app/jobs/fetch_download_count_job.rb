class FetchDownloadCountJob < ApplicationJob
  def perform
    data = fetch_data
    data.each_line do |line|
      splitted_data = line.split(" ")
      Download.set_download_count(splitted_data[0], splitted_data[1].to_i)
    end
  end

  private

  def fetch_data
    open(ENV.fetch("STATS_URL")).read
  end
end
