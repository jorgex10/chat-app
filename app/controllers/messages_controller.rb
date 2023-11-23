class MessagesController < ApplicationController
  before_action :set_room, only: %i[create edit]
  before_action :set_message, only: %i[edit update]

  def create
    @message = @room.messages.new(message_params)
    @message.user = current_user

    respond_to do |format|
      format.turbo_stream if @message.save
    end
  end

  def edit; end

  def update
    respond_to do |format|
      format.turbo_stream if @message.update(message_params)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
