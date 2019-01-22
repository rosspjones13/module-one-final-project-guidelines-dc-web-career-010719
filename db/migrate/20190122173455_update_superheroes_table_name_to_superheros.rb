class UpdateSuperheroesTableNameToSuperheros < ActiveRecord::Migration[5.0]
  def change
    rename_table :superheroes, :superhero
  end
end
