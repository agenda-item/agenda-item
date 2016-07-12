class AddChairToMeetings < ActiveRecord::Migration
  def change
    add_reference :meetings, :chair, foreign_key: true 
  end
end
