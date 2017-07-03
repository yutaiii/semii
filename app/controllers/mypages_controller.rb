class MypagesController < ApplicationController
  def index
    if user_signed_in?
      @post = Post.new
      @posts = Post.where(seminar_id: current_user.seminar_id).order('created_at desc').page(params[:page]).per(5)
    else
      redirect_to(new_user_session_path)
    end
  end
end
