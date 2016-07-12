class AddOptions < ActiveRecord::Migration
  def change
    create_table "options", force: :cascade do |t|
      t.references :agenda_item
      t.string "name"
      t.boolean "show_option", default: false
      t.text "instructions"
      t.timestamps
    end  
  end
end
