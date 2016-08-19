class Organization < ActiveRecord::Base

  has_many :users

  validates :email,
    presence: true

end