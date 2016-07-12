class AddCreatorToAgendaItems < ActiveRecord::Migration
  def change
    add_reference :agenda_items, :creator, index: true, foreign_key: true    
  end
end
