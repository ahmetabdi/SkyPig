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

ActiveRecord::Schema.define(:version => 20120731063721) do

  create_table "stiki_authors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "authorable_id"
    t.string   "authorable_type"
    t.boolean  "creator"
    t.boolean  "last_edit"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "stiki_authors", ["authorable_id", "authorable_type"], :name => "index_stiki_authors_on_authorable_id_and_authorable_type"

  create_table "stiki_pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "space_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stiki_spaces", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stiki_spaces", ["slug"], :name => "index_stiki_spaces_on_slug", :unique => true

end
