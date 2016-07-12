class AddRespsonsibleUsers < ActiveRecord::Migration
  def change
    create_table "responsible_users", force: :cascade do |t|
      t.references :agenda_item
      t.references :user
      t.timestamps
    end    
  end
end
