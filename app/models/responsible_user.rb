class ResponsibleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :agenda_item
end