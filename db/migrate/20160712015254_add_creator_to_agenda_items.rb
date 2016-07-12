class AddCreatorToAgendaItems < ActiveRecord::Migration
  def change
    add_reference :agenda_items, :creator, index: true  
  end
end
