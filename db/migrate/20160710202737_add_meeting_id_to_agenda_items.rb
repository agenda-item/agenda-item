class AddMeetingIdToAgendaItems < ActiveRecord::Migration
  def change
    add_reference :agenda_items, :meeting, foreign_key: true    
  end
end
