class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.decimal :snow_allday, :snow_day, :snow_night, :high, :low
      t.datetime :date_epoch
      t.belongs_to :resort

      t.timestamps(null: false)
    end
  end
end
