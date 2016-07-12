class AddChairToMeetings < ActiveRecord::Migration
  def change
    add_reference :meetings, :chair
  end
end
