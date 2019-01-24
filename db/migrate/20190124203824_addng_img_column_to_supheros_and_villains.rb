class AddngImgColumnToSupherosAndVillains < ActiveRecord::Migration[5.2]
  def change
    add_column :superheros, :img, :string
    add_column :villains, :img, :string
  end
end
