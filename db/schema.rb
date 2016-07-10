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

ActiveRecord::Schema.define(version: 20160709204722) do

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

end
