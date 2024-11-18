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

ActiveRecord::Schema[7.2].define(version: 2024_10_30_134749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.text "description"
    t.string "color"
    t.string "status"
    t.integer "project_id", default: 0, null: false
    t.datetime "created_on", precision: nil, null: false
    t.string "created_by"
    t.datetime "updated_on", precision: nil
    t.string "updated_by"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.datetime "created_on", precision: nil, null: false
    t.string "created_by"
    t.datetime "updated_on", precision: nil
    t.string "updated_by"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password"
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.string "status"
    t.datetime "last_login_on", precision: nil
    t.datetime "created_on", precision: nil, null: false
    t.datetime "updated_on", precision: nil
    t.index ["login"], name: "users_login"
  end
end
