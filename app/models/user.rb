class User < ActiveRecord::Base

  include BCrypt

  attr_accessor :password, :password_confirmation

  self.inheritance_column = nil

  belongs_to :organization

  has_many :meeting_attendees
  has_many :meetings, through: :meeting_attendees

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

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    :if => lambda { |user| user.type != "Board" }

   
   # code to get around has_secure_password when 
   # user creates board members with no passwords

  validates :password, length: (6..32), confirmation: true, if: :setting_password?

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def authenticate(password)
    password.present? && password_digest.present? && Password.new(password_digest) == password
  end

  private

    def setting_password?
      password || password_confirmation
    end

end
