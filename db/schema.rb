# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2015_12_05_173906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.text "description"
    t.string "status"
    t.integer "project_id", default: 0, null: false
    t.datetime "created_on", null: false
    t.string "created_by"
    t.datetime "updated_on"
    t.string "updated_by"
    t.string "color"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.datetime "created_on", null: false
    t.string "created_by"
    t.datetime "updated_on"
    t.string "updated_by"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_on", null: false
    t.datetime "updated_on"
    t.index ["name"], name: "statuses_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password"
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.string "status"
    t.datetime "last_login_on"
    t.datetime "created_on", null: false
    t.datetime "updated_on"
    t.index ["login"], name: "users_login"
  end

end
