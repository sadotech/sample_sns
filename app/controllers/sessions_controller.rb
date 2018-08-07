class SessionsController < ApplicationController
  def new
    if session[:login_id]
      user = User.find_by(session[:id])
      redirect_to posts_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to posts_path
    else
      return render 'new'
    end
  end

  def destroy
    if !session[:login_id]
      render 'destroy', no_login: true
    else
      log_out
      render 'destroy'
    end
  end
end
