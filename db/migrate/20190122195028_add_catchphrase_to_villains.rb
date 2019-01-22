class AddCatchphraseToVillains < ActiveRecord::Migration[5.0]
  def change
    add_column :villains, :catchphrase, :string
  end
end
