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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_05_03_035632) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_05_05_063623) do
>>>>>>> parent of 89d7a11 (Create the password authentication to the user modal)
  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "author", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
=======
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> parent of 89d7a11 (Create the password authentication to the user modal)
  end

end
