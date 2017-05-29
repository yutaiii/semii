class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  #deviseに含まれていないカラムを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:faculty_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:department_id])
  end

  #ログアウトした後のリダイレクト先
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
