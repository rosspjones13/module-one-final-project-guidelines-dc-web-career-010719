class CreateFightsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :fights do |t|
      t.integer :superhero_id
      t.integer :villain_id
      t.string :location
    end
  end
end
