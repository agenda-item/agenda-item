class RenameAjournmentTimeInMeetings < ActiveRecord::Migration
  def change
    rename_column :meetings, :ajournment_time, :adjournment_time
  end
end
