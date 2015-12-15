class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name, :city, :state

      t.timestamps(null: false)
    end
  end
end
