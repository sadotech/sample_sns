class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    user = User.new(
      account_id: user_params[:account_id], 
      email: user_params[:email],
      password: user_params[:password]
    )

    if user.save
      redirect_to user
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:account_id, :email, :password)
  end
end
