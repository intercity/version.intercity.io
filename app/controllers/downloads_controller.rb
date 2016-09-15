class DownloadsController < ApplicationController
  def index
    @downloads = DailyDownload.all.sum(:amount)
  end
end
