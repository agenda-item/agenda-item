class Meeting < ActiveRecord::Base

  validates :meeting_date,
    presence: true

  validates :title,
    presence: true 

  validates :status,
    presence: true   

end