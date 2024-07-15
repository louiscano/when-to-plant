class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.string :nom_scientifique
      t.string :famille
      t.string :type_semis
      t.text :conseil_semis
      t.text :conseil_culture
      t.string :periode_semis
      t.string :periode_recoltes
      t.string :culture
      t.string :exposition
      t.string :besoin_eau
      t.string :nature_sol
      t.string :qualite_sol
      t.string :hauteur
      t.text :maladie
      t.string :ecart_rang
      t.string :temperature
      t.string :difficulte

      t.timestamps
    end
  end
end
