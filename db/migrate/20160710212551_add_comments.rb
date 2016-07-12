class AddComments < ActiveRecord::Migration
  def change
    create_table "comments", force: :cascade do |t|
      t.references :agenda_item
      t.references :user
      t.text "content"
    end   
  end
end
