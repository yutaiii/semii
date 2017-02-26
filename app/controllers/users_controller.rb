class UsersController < ApplicationController
  def signin
    @user = User.new
    if request.post?
      user = User.where(name: params[:name], password: params[:password])
      if user.present?
        redirect_to root_path
      else
        redirect_to users_sign_in_path
      end
    end
  end
end
