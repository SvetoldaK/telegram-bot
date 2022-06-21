class SubgroupController < ApplicationController

  def create
    @subgroup = Subgroup.new(subgroup_params)
    @subgroup.save!
    redirect_to
  end

  def destroy
    @subgroup = Subgroup.find(params[:id])
    @subgroup.destroy

    redirect_to(user_path, status: 303)
  end

  def edit
    @subgroup = Subgroup.find(params[:id])
  end

  def update
    @subgroup = Subgroup.find(params[:id])

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
end
