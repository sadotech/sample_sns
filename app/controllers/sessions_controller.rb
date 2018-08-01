class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path id: user.id
    else
      return render 'new'
    end
  end

  def destroy
    log_out
    render 'new'
  end
end
