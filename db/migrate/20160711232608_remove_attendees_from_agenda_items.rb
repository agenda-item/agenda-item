class RemoveAttendeesFromAgendaItems < ActiveRecord::Migration
  def change
    remove_column :agenda_items, :attendees, :text  
  end
end
