class Vote < ActiveRecord::Base
  scope :in_favour, -> { where(vote_type: "In Favour") }
  scope :opposed, -> { where(vote_type: "Opposed") }
  scope :abstained, -> { where(vote_type: "Abstained") }

  belongs_to :agenda_item

  belongs_to :voting_user, 
              class_name: "User"
end