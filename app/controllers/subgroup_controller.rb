class SubgroupController < ApplicationController
  before_action :set_subgroup, only: [:destroy]

  def create
    @subgroup = Subgroup.new(subgroup_params)
    @subgroup.save!
    redirect_to
  end

  def destroy
    @subgroup.destroy

    redirect_to(user_path, status: 303)
  end

  private

  def subgroup_params
    params.permit(:name, :nickname, :user_id)
  end

  def set_subgroup
    @subgroup = Subgroup.find(params[:id])
  end
end
