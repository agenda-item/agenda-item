class AddMeetingAttendees < ActiveRecord::Migration
  def change
    create_table "meeting_attendees", force: :cascade do |t|
      t.references :meeting
      t.references :user
      t.string "attendance_type", default: "absent"
      t.timestamps
    end
  end
end
