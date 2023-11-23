class MessagesController < ApplicationController
  before_action :set_room, only: :create

  def create
    @message = @room.messages.new(message_params)
    @message.user = current_user

    respond_to do |format|
      format.turbo_stream if @message.save
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
