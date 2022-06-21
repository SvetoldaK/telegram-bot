class SubgroupController < ApplicationController
  before_action :set_subgroup, only: [:edit, :update, :destroy]

  def create
    @subgroup = Subgroup.new(subgroup_params)
    @subgroup.save!
    redirect_to
  end

  def destroy
    @subgroup.destroy

    redirect_to(user_path, status: 303)
  end

  def edit
  end

  def update

    if @subgroup.update(subgroup_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def subgroup_params
    params.permit(:name, :nickname, :user_id)
  end

  def set_subgroup
    @subgroup = Subgroup.find(params[:id])
  end

end
