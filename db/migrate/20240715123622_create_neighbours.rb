class CreateNeighbours < ActiveRecord::Migration[7.1]
  def change
    create_table :neighbours do |t|
      t.string :voisin
      t.references :plant_1, null: false, foreign_key: { to_table: :plants }
      t.references :plant_2, null: false, foreign_key: { to_table: :plants }

      t.timestamps
    end
  end
end
