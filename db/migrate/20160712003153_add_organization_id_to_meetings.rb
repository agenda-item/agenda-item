class AddOrganizationIdToMeetings < ActiveRecord::Migration
  def change
    add_reference :meetings, :organization, foreign_key: true    
  end
end
