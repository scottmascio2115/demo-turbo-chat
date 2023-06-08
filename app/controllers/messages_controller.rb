class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order(id: :asc)
    @logged_in_users = User.where(logged_in: true)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge({user_id: current_user.id}))

    if @message.save
      redirect_to messages_path, notice: "Message was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to messages_path, notice: "Message was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_path, notice: "Message was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
