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

ActiveRecord::Schema.define(version: 20160915170040) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "observation_id"
    t.text     "text"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "experiments", force: :cascade do |t|
    t.integer  "project_admin_id"
    t.boolean  "approved?"
    t.string   "title"
    t.text     "hypothesis"
    t.text     "summary"
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "experiments_users", id: false, force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "experiment_id", null: false
    t.index ["experiment_id", "user_id"], name: "index_experiments_users_on_experiment_id_and_user_id"
    t.index ["user_id", "experiment_id"], name: "index_experiments_users_on_user_id_and_experiment_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experiment_id"
    t.string   "title"
    t.text     "text"
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.boolean  "global_admin?"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
