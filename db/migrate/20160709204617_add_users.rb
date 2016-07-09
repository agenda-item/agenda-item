class AddUsers < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |t|
      t.references :organization
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "type"
      t.string "permissions",                 default: "false"
      t.string "org_title"
      t.string "password_digest"
      t.string "phone"
      t.boolean "phone_permission",           default: false
      t.string "mobile"
      t.string "address"
      t.boolean "mail_permission",            default: false
      t.boolean "meeting_email_permission",   default: false
      t.boolean "reminders_email_permission", default: false
      t.timestamps
    end  
  end
end
