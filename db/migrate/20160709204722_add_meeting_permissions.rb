class AddMeetingPermissions < ActiveRecord::Migration
  def change
    create_table "meeting_permissions", force: :cascade do |t|
      t.references :user
      t.references :meeting
      t.timestamps
    end   
  end
end
