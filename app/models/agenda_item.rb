class AgendaItem < ActiveRecord::Base  
  belongs_to :responsible_user, 
              class_name: "User"

  belongs_to :mover, 
              class_name: "User"
              
  belongs_to :seconder, 
              class_name: "User"
end