class CreateScenariosTable < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.string :description
      t.integer :quest_id
    end
  end
end
