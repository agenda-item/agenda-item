class User < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :organization

  has_many :meeting_attendees
  
  has_many :meeting_permissions
  has_many :meetings, through: :meeting_permissions

  has_many :responsible_users
  has_many :agenda_items, through: :responsible_users

  has_many :mover_agenda_items,
            class_name: "AgendaItem",
            foreign_key: "mover_id"

  has_many :seconder_agenda_items,
            class_name: "AgendaItem",
            foreign_key: "seconder_id"

  has_many :chaired_meetings,
            class_name: "Meeting",
            foreign_key: "chair_id"

  has_many :creator_agenda_items,
            class_name: "AgendaItem",
            foreign_key: "creator_id"

  has_many :votes

  # has_secure_password

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    :if => lambda { |user| user.type != "Board" }

end
