class AddNextMeetingDateToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :next_meeting_date, :datetime
  end
end
