class PostsController < ApplicationController
  def new
    redirect_to login_path if session[:login_id].blank?
    @post = Post.new
  end

  def create
  end

  def edit
    redirect_to login_path if session[:login_id].blank?
  end

  def index
    redirect_to login_path if session[:login_id].blank?
    @posts = Post.all
  end

  def show
    redirect_to login_path if session[:login_id].blank?
  end

  def update
  end

  def destroy
  end
end
