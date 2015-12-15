class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :name, :password_hash, :phone

      t.timestamps(null: false)
    end
  end
end
