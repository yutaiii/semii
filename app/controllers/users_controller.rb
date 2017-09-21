class UsersController < ApplicationController
  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
      @faculty = Faculty.all
      @department = Faculty.all
      @teacher = Teacher.all
      seminar = Seminar.find(current_user.seminar_id)
      @seminarTeacher = Teacher.find(seminar.teacher_id)
    else
      redirect_to(root_path)
    end
  end
end
