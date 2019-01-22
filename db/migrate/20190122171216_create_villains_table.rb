class CreateVillainsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :villains do |t|
      t.string :name
      t.integer :power
      t.integer :combat
    end
  end
end
