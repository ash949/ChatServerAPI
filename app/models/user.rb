class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :subscriptions
  has_many :rooms, through: :subscriptions
  has_many :messages

  def subscribe(room)
    subscriptions.create!(room: room)
  end

  def send_message(body, room)
    message = Message.new(body: body, room: room)
    messages << message
    message.save
  end
end
