# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140517015533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directions", force: true do |t|
    t.text     "step"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "directions", ["recipe_id"], name: "index_directions_on_recipe_id", using: :btree

  create_table "ingredient_lines", force: true do |t|
    t.string   "quantity"
    t.string   "directions"
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_lines", ["ingredient_id"], name: "index_ingredient_lines_on_ingredient_id", using: :btree
  add_index "ingredient_lines", ["recipe_id"], name: "index_ingredient_lines_on_recipe_id", using: :btree

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
