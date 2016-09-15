class DownloadsController < ApplicationController
  def index
    @downloads = Download.all.sum(:amount)
  end
end
