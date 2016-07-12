class AgendaItem < ActiveRecord::Base
  self.inheritance_column = nil
  
  has_many :responsible_users
  has_many :users, through: :responsible_users
  has_many :votes

  has_many :users_in_favour,
  -> { in_favour }, through: :votes, class_name: "User", foreign_key: "voting_user_id"

  has_many :users_opposed,
  -> { opposed }, through: :votes, class_name: "User", foreign_key: "voting_user_id"

  has_many :users_abstained,
  -> { abstained }, through: :votes, class_name: "User", foreign_key: "voting_user_id"

  belongs_to :mover,
              class_name: "User"

  belongs_to :seconder,
              class_name: "User"

  belongs_to :creator,
              class_name: "User"
end
