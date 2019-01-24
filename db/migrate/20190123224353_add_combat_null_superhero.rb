class AddCombatNullSuperhero < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :superheros, :combat, from: nil, to: 25
  	change_column_default :superheros, :power, from: nil, to: 25
  end
end
