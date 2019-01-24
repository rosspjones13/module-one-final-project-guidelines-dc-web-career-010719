class AddCombatDefaultSuperhero < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :superheros, :combat, 25
  	change_column_null :superheros, :power, 25
  end
end
