class MessagesController < ApplicationController

  private
  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
