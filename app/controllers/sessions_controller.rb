class SessionsController < ApplicationController
  def new
  end

  def create
    @login_user = User.find_by(email: params[:session][:email])
    if !@login_user.nil? && @login_user.authenticate(params[:session][:password])
      log_in @login_user
      redirect_to login_user_path(id: @login_user.id)
    else
      return render 'new'
    end
  end

  def destroy
  end
end
