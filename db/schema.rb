# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_15_130332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "titre"
    t.text "contenu"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "nom"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "neighbours", force: :cascade do |t|
    t.string "voisin"
    t.bigint "plant_1_id", null: false
    t.bigint "plant_2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_1_id"], name: "index_neighbours_on_plant_1_id"
    t.index ["plant_2_id"], name: "index_neighbours_on_plant_2_id"
  end

  create_table "plant_lists", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_plant_lists_on_list_id"
    t.index ["plant_id"], name: "index_plant_lists_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "nom_scientifique"
    t.string "famille"
    t.string "type_semis"
    t.text "conseil_semis"
    t.text "conseil_culture"
    t.string "periode_semis"
    t.string "periode_recoltes"
    t.string "culture"
    t.string "exposition"
    t.string "besoin_eau"
    t.string "nature_sol"
    t.string "qualite_sol"
    t.string "hauteur"
    t.text "maladie"
    t.string "ecart_rang"
    t.string "temperature"
    t.string "difficulte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "titre"
    t.text "contenu"
    t.string "categorie"
    t.date "date_publication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string "titre"
    t.text "contenu"
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_tips_on_plant_id"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prenom"
    t.string "nom"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "lists", "users"
  add_foreign_key "neighbours", "plants", column: "plant_1_id"
  add_foreign_key "neighbours", "plants", column: "plant_2_id"
  add_foreign_key "plant_lists", "lists"
  add_foreign_key "plant_lists", "plants"
  add_foreign_key "tips", "plants"
  add_foreign_key "tips", "users"
end
