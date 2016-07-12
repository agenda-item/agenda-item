class Meeting < ActiveRecord::Base

  has_many :meeting_permissions
  has_many :users, through: :meeting_permissions
  belongs_to :chair, 
              class_name: "User"

  validates :meeting_date,
    presence: true

  validates :title,
    presence: true 

  validates :status,
    presence: true   

end