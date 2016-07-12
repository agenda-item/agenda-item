class AddAjournmentTimeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :ajournment_time, :datetime
  end
end
