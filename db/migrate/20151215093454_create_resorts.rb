class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name, :city, :state, :region

      t.timestamps(null: false)
    end
  end
end
