class RoomsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def show; end

  def new
    @room = Room.new
  end

  def edit; end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('rooms', partial: 'shared/room', locals: { room: @room })
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('room_form', partial: 'rooms/form', locals: { room: @room, title: 'Create new room' })
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("room_#{@room.id}", partial: 'shared/room', locals: { room: @room })
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room.destroy!
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
