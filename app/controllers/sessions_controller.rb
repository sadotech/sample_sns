class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    return render 'new' if user.nil?
    redirect_to user
  end

  def destroy

  end
end
