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
  end

  def show_login_user
    @login_user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:account_id, :email, :password, :password_confirmation)
  end
end
