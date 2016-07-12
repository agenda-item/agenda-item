class AddPositionToAgendaItems < ActiveRecord::Migration
  def change
    add_column :agenda_items, :position, :integer
  end
end
