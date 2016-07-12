class AddTemplates < ActiveRecord::Migration
  def change
    create_table "templates", force: :cascade do |t|
      t.string "title"
      t.text "description"
      t.timestamps
    end    
  end
end
