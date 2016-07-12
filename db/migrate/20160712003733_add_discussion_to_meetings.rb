class AddDiscussionToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :discussion, :text
  end
end
