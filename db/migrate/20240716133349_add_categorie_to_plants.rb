class AddCategorieToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :categorie, :string
  end
end
