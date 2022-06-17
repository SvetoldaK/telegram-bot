class SubgroupController < ApplicationController
  def create
    @subgroup = Subgroup.new(subgroup_params)
    @subgroup.save!
    redirect_to root_path
  end

  private

  def subgroup_params
    params.permit(:name, :nickname, :user_id)
  end
end
