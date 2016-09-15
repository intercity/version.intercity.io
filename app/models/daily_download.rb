class DailyDownload < ApplicationRecord
  validates :download_date, presence: true

  def self.set_download_count(day, amount)
    download = DailyDownload.where(download_date: day).first_or_initialize
    download.amount = amount
    download.save
  end
end
