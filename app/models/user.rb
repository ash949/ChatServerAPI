class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :subscriptions
  has_many :rooms, through: :subscriptions

  def subscribe(room)
    subscriptions.create!(room: room)
  end
end
