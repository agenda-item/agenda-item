class AddVotes < ActiveRecord::Migration
  def change
    create_table "votes", force: :cascade do |t|
      t.references :agenda_item
      t.references :voting_user
      t.references :proxy_user
      t.boolean "proxy", default: false
      t.string "vote_type"
      t.timestamps
    end   
  end
end
