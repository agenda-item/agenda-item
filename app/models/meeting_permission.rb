class MeetingPermission < ActiveRecord::Base

  belongs_to :meeting
  belongs_to :user

validates :meeting_permissions,
    presence: true 

end