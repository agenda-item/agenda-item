class AddOrganizations < ActiveRecord::Migration
  def change
    create_table "organizations", force: :cascade do |t|
      t.string "name"
      t.string "logo"
      t.string "phone"
      t.string "email"
      t.string "address"
      t.string "website"
      t.references :user
      t.timestamps
    end     
  end
end
