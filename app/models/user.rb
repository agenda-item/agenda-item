class User < ActiveRecord::Base

  has_many :meeting_permissions
  has_many :meetings, through: :meeting_permissions

  has_secure_password

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true

end