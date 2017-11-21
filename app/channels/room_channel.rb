class RoomChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
  end

  def broadcast_message(data)
    room_id = data['room_id'].to_s
    user_id = data['current_user_id']
    message_body = data['message_body']

    room = Room.find(room_id)
    user = User.find(user_id)
    user.send_message(message_body, room)

    RoomChannel.broadcast_to room_id, message: {
      user_id: user_id, nickname: user.nickname, body: message_body
    }
  end

  def listen(data)
    stream_for data['room_id']
  end
end
