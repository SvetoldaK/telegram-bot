class GroupController < ApplicationController
  before_action :set_group, only: [:show, :edit, :destroy, :update]
  before_action :set_chat
  before_action :authenticate_user!

  def show; end

  def edit; end

  def new
    @group = Group.new
  end

  def update
    if @group.update!(group_params)
      redirect_to user_chat_path(current_user.id, @chat.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @group = Group.create(group_params)
    if @group.valid?
      redirect_to user_chat_path(current_user.id, @chat.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy

    redirect_to(user_chat_path(current_user.id, @chat.id), status: 303)
  end

  private

  def group_params
    params.require(:group).permit(:name, :nickname, :chat_id)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end
