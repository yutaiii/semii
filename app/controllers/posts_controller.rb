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


private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :seminar_id)
  end
end
