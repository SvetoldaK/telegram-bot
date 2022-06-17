# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resourse)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(_resourse)
    root_path
  end
end
