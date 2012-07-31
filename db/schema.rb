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

ActiveRecord::Schema.define(:version => 20120731015641) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dashboard_blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "social_tokens", :force => true do |t|
    t.string   "type"
    t.integer  "website_id"
    t.text     "preferences"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "social_tokens", ["website_id"], :name => "index_social_tokens_on_website_id"

  create_table "thoughts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "website_pages", :force => true do |t|
    t.string   "title"
    t.text     "body_markdown"
    t.text     "body_html"
    t.integer  "website_id"
    t.string   "path"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "published",     :default => true
  end

  add_index "website_pages", ["path"], :name => "index_website_pages_on_path"
  add_index "website_pages", ["website_id"], :name => "index_website_pages_on_website_id"

  create_table "websites", :force => true do |t|
    t.string   "domain"
    t.integer  "user_id"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.boolean  "website_pages_enabled", :default => false
    t.integer  "homepage_id"
    t.string   "title",                 :default => "My Great Website"
  end

  add_index "websites", ["user_id"], :name => "index_websites_on_user_id"

  create_table "workouts", :force => true do |t|
    t.string   "workout_type"
    t.datetime "workout_time"
    t.integer  "intensity"
    t.string   "length_or_count"
    t.text     "comments"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
  end

end
