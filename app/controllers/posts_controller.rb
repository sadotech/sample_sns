class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    login_user = User.find(session[:login_id])
    login_user.posts.create(content: params[:post][:content])
    if params[:post][:main_post_id]
      replying_post = login_user.posts.last
      replied_post = Post.find(params[:post][:main_post_id])
      replied_post.replied_relationships.create(reply_post_id: replying_post.id)
    end
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    login_user = User.find(session[:login_id])
    all_posts = login_user.following.each_with_object([]) do |following, following_posts|
      following.posts.each do |post|
        following_posts.push(post)
      end
    end
    login_user.posts.each do |post|
      all_posts.push(post)
    end
    @posts = all_posts.sort{ |a, b| b.updated_at <=> a.updated_at }
  end

  def show
    @post = Post.find(params[:id])
  end

  def share
    login_user = User.find(session[:login_id])
    share_post = login_user.posts.create()
    origin_post = Post.find(params[:post][:id])
    if !origin_post.shared.map(&:user_id).include?(login_user.id)
      origin_post.shared_relationships.create(share_post_id: share_post.id)
    end
    redirect_to posts_path
  end

  def destroy_share
    login_user = User.find(session[:login_id])
    origin_post = Post.find(params[:post][:id])
    share_post = Post.find(params[:post][:share_post_id])
    if origin_post.shared.include?(share_post)
      origin_post.shared_relationships.find_by(share_post_id: share_post.id).destroy
      share_post.destroy
    end
    redirect_to posts_path
  end

  def update
  end

  def destroy
  end
end
