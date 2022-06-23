class SubgroupController < ApplicationController
  before_action :set_subgroup, only: [:show, :edit, :destroy, :update]

  def edit; end

  def new
    @subgroup = Subgroup.new
  end

  def update
    @user = User.find(@subgroup.user_id)
    puts 'subgroup_params'
    puts subgroup_params
    puts 'subgroup_params'
    if @subgroup.update!(subgroup_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @subgroup = Subgroup.new(subgroup_params)
    @subgroup.save!
    redirect_to user_path(current_user.id)
  end

  def destroy
    @subgroup.destroy

    redirect_to(user_path, status: 303)
  end

  private

  def subgroup_params
    params.require(:subgroup).permit(:name, :nickname, :user_id).tap do |param|
      param[:user_id] = current_user.id
    end
  end

  def set_subgroup
    @subgroup = Subgroup.find(params[:id])
  end
end
