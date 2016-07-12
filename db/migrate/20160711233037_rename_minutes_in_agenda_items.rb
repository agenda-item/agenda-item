class RenameMinutesInAgendaItems < ActiveRecord::Migration
  def change
    rename_column :agenda_items, :minutes, :discussion
  end
end
