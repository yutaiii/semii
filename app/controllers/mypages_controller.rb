class MypagesController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.where(seminar_id: current_user.seminar_id).order('created_at desc').page(params[:page]).per(5)
  end
end
