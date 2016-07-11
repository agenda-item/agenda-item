class RemoveVoteFromAgendaItems < ActiveRecord::Migration
  def change
    remove_column :agenda_items, :vote, :text  
  end
end
