class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates :user, uniqueness: { scope: :room, message: ": You have already subscribed to this room" }
end