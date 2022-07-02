class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :login

  def show
    @user = User.find(params[:id])
  end

  private

  def login
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end
end
