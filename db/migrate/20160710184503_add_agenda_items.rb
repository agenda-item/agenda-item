class AddAgendaItems < ActiveRecord::Migration
  def change
    create_table "agenda_items", force: :cascade do |t|
      t.string "tags"
      t.string "type"
      t.string "title"
      t.text "description"
      t.text "minutes"
      t.string "file_path"
      t.references :responsible_user
      t.references :mover
      t.references :seconder
      t.text "vote"
      t.datetime "due_date"
      t.text "attendees"
      t.text "status"
      t.timestamps
    end   
  end
end
