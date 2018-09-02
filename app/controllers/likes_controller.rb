class LikesController < ApplicationController
  def create
    post = Post.find(params[:like][:post_id])
    if !post.likes.find_by(user_id: session[:longin_id]).present?
      post.likes.create(user_id: session[:login_id], post_id: post.id)
    end
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:like][:post_id])
    if post.likes.find_by(user_id: session[:login_id]).present?
      post.likes.find_by(user_id: session[:login_id]).destroy
    end
    redirect_to posts_path
  end
end
