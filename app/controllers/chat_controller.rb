class ChatController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!

  def edit; end

  def new
    @chat = Chat.new
  end

  def update
    @user = User.find(@chat.user_id)
    if @chat.update!(chat_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save!
    redirect_to user_path(current_user.id)
  end

  def destroy
    @chat.destroy

    redirect_to(user_path, status: 303)
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :chat_id, :user_id).tap do |param|
      param[:user_id] = current_user.id
    end
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
