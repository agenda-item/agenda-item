class User < ActiveRecord::Base

  has_many :meeting_permissions
  has_many :meetings, through: :meeting_permissions

  has_many :responsible_user_agenda_items, 
            class_name: "AgendaItem", 
            foreign_key: "responsible_user_id"

  has_many :mover_agenda_items, 
            class_name: "AgendaItem", 
            foreign_key: "mover_id"

  has_many :seconder_agenda_items, 
            class_name: "AgendaItem", 
            foreign_key: "seconder_id"

  has_secure_password

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true

end