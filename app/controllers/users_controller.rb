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

  def signup
    @user = User.new
    # @user = User.save(signup_params)
  end

  # private
  # def signup_params
  #   params.require(:user).permit(:name, :password, :faculty_id, :department_id, :seminar_id)
  # end

end
