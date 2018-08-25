class PostsController < ApplicationController
  def new
    binding.pry
    @post = Post.new
  end

  def create
    login_user = User.find(session[:login_id])
    login_user.posts.create(content: params[:post][:content])
    redirect_to posts_path
  end

  def edit
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
  end

  def update
  end

  def destroy
  end
end
