class CreateDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :downloads do |t|
      t.date :download_date
      t.integer :amount

      t.timestamps
    end
  end
end
