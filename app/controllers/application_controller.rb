class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :edit_permitted_parameters, if: :devise_controller?
  before_action :setSeminarName
  before_action :getFaculty, if: :devise_controller?, on: :edit
  before_action :getDepartment, if: :devise_controller?, on: :edit
  before_action :getSeminar, if: :devise_controller?, on: :edit

  #deviseに含まれていないカラムを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:faculty_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:department_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:seminar_id])
  end

  def edit_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:faculty_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:department_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:seminar_id])
  end

  #ログアウトした後のリダイレクト先
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def setSeminarName
    if user_signed_in? === false
      return
    end
    if current_user.seminar_id.nil?
      @seminarName = '〇〇'
    else
      seminar = Seminar.find(current_user.seminar_id)
      @seminarName = seminar.name
    end
  end

  def getFaculty
    @faculty = Faculty.all
  end

  def getDepartment
    @department = Department.all
  end

  def getSeminar
    @seminar = Seminar.all
  end
end
