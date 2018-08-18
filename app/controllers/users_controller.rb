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
    other_user = User.find(session[:login_id])
    @following = following?(other_user)
    @followed = followed?(other_user)
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
    other_user = User.find(params[:other_user_id])
    other_user.active_relationships.create(followed_id: @user.id)
    redirect_to user_path(id: @user.id)
  end

  def unfollow
    @user = User.find(params[:id])
    other_user = User.find(params[:other_user_id])
    other_user.active_relationships.find_by(followed_id: @user.id).destroy
    redirect_to user_path(id: @user.id)
  end

  def following?(other_user)
    # other_user(=ログインしているユーザー)のfollowingの中に@userがいるか確認
    other_user.following.include?(@user)
  end

  def followed?(other_user)
    @user.following.include?(other_user)
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
