class AddMeetingPermissions < ActiveRecord::Migration
  def change
    create_table "meeting_permissions", force: :cascade do |t|
      t.references :user
      t.references :meeting
      t.string "meeting_permissions", default: "false"
      t.timestamps
    end   
  end
end
