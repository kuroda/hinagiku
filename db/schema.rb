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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111204114213) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner_id",   :null => false
  end

  create_table "emails", :force => true do |t|
    t.integer  "user_id",            :null => false
    t.string   "address",            :null => false
    t.string   "verification_token", :null => false
    t.datetime "verified_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "emails", ["address"], :name => "index_emails_on_address", :unique => true

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "due_date"
    t.boolean  "done"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.integer  "owner_id",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login_name",       :null => false
    t.string   "display_name",     :null => false
    t.string   "password_digest",  :null => false
    t.string   "auto_login_token"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "verified_at"
  end

  add_index "users", ["login_name"], :name => "index_users_on_login_name", :unique => true

end
