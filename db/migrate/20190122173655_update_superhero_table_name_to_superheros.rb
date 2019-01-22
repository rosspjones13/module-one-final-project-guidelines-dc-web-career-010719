class UpdateSuperheroTableNameToSuperheros < ActiveRecord::Migration[5.0]
  def change
    rename_table :superhero, :superheros
  end
end
