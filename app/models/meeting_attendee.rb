class MeetingAttendee < ActiveRecord::Base
  belongs_to :meeting
end