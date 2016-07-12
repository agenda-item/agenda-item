class AddMeetings < ActiveRecord::Migration
  def change
    create_table "meetings", force: :cascade do |t|
      t.datetime "meeting_date"
      t.references :template
      t.string "title"
      t.string "status"
      t.timestamps
    end     
  end
end
