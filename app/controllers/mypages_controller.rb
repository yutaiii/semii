class MypagesController < ApplicationController
  def index
    if user_signed_in?
      @post = Post.new
      @posts = Post.where(seminar_id: current_user.seminar_id).order('created_at desc').page(params[:page]).per(5)
      if current_user.seminar_id.nil?
        @seminarName = '〇〇'
      else
        seminar = Seminar.find(current_user.seminar_id)
        @seminarName = seminar.name
      end
      @department = Department.find(current_user.department_id)
      @faculty = Faculty.find(current_user.faculty_id)
      teacherId = Seminar.find(current_user.seminar_id).teacher_id
      @teacher = Teacher.find(teacherId)
    else
      redirect_to(new_user_session_path)
    end
  end
end
