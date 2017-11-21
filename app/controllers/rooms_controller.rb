class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
    render json: {
      id: room.id,
      name: room.name,
      messages: Message.includes(:user).where("room_id = #{room.id}").order(id: :desc).pluck(:user_id, :nickname, :body)
    }
  end
end
