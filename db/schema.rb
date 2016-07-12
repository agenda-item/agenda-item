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

ActiveRecord::Schema.define(version: 20160712003958) do

  create_table "agenda_items", force: :cascade do |t|
    t.string   "tags"
    t.string   "type"
    t.string   "title"
    t.text     "description"
    t.text     "discussion"
    t.string   "file_path"
    t.integer  "mover_id"
    t.integer  "seconder_id"
    t.datetime "due_date"
    t.text     "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_id"
    t.integer  "position"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "agenda_item_id"
    t.integer "user_id"
    t.text    "content"
  end

  create_table "meeting_attendees", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.string   "attendance_type", default: "absent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meeting_permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.string   "meeting_permissions", default: "false"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "meeting_date"
    t.integer  "template_id"
    t.string   "title"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "location"
    t.integer  "chair_id"
    t.text     "description"
    t.text     "discussion"
    t.datetime "ajournment_time"
    t.datetime "next_meeting_date"
  end

  create_table "options", force: :cascade do |t|
    t.integer  "agenda_item_id"
    t.string   "name"
    t.boolean  "show_option",    default: false
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responsible_users", force: :cascade do |t|
    t.integer  "agenda_item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "type"
    t.string   "org_title"
    t.string   "password_digest"
    t.string   "phone"
    t.boolean  "phone_permission",           default: false
    t.string   "mobile"
    t.string   "address"
    t.boolean  "mail_permission",            default: false
    t.boolean  "meeting_email_permission",   default: false
    t.boolean  "reminders_email_permission", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "agenda_item_id"
    t.integer  "voting_user_id"
    t.integer  "proxy_user_id"
    t.boolean  "proxy",          default: false
    t.string   "vote_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
