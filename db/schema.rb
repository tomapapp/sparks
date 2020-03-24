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

ActiveRecord::Schema.define(version: 2020_03_24_145725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "time"
    t.bigint "recommendation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommendation_id"], name: "index_availabilities_on_recommendation_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datenights", force: :cascade do |t|
    t.datetime "time"
    t.bigint "recommendation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommendation_id"], name: "index_datenights_on_recommendation_id"
    t.index ["user_id"], name: "index_datenights_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_preferences_on_category_id"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.integer "rating"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_recommendations_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "secondary_email"
    t.string "location"
    t.integer "date_frequency"
    t.string "day"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "recommendations"
  add_foreign_key "datenights", "recommendations"
  add_foreign_key "datenights", "users"
  add_foreign_key "preferences", "categories"
  add_foreign_key "preferences", "users"
  add_foreign_key "recommendations", "categories"
end
