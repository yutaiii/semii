class PostsController < ApplicationController
  def add
    post = Post.new(post_params)
    if post.save
      flash[:notice] = '投稿しました。'
    else
      flash[:notice] = '投稿に失敗しました。'
    end
    redirect_to root_path
  end

  def view
    @postsCount = Post.where(seminar_id: current_user.seminar_id).count
    @posts = Post.where(seminar_id: current_user.seminar_id).order(created_at: 'DESC').page(params[:page]).per(5)
  end


private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :seminar_id)
  end
end
