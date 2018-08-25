class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    user = User.new(
      account_id: user_params[:account_id], 
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )

    if user.save
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    login_user = User.find(session[:login_id])
    @following = following?(login_user)
    @followed = followed?(login_user)
  end

  def update
    @user = User.find_by(params[:id])
    @user[:name] = params[:user][:name].blank? ? nil : params[:user][:name]
    @user.save
    render "show"
  end

  def destroy
  end

  def follow
    @user = User.find(params[:id])
    login_user = User.find(params[:login_user_id])
    login_user.active_relationships.create(followed_id: @user.id)
    redirect_to user_path(id: @user.id)
  end

  def unfollow
    @user = User.find(params[:id])
    login_user = User.find(params[:login_user_id])
    login_user.active_relationships.find_by(followed_id: @user.id).destroy
    redirect_to user_path(id: @user.id)
  end

  def following?(login_user)
    # login_user(=ログインしているユーザー)のfollowingの中に@userがいるか確認
    login_user.following.include?(@user)
  end

  def followed?(login_user)
    @user.following.include?(login_user)
  end

  def following
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end
  private

  def user_params
    params.require(:user).permit(:account_id, :email, :password, :password_confirmation)
  end
end
