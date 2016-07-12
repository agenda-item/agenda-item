class RemoveResponsibleUserIdFromAgendaItems < ActiveRecord::Migration
  def change
    remove_reference :agenda_items, :responsible_user    
  end
end
