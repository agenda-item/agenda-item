class Organization < ActiveRecord::Base

  has_many :users
  has_many :meetings

  validates :email,
    presence: true

end