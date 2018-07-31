module SessionsHelper
  def log_in(user)
    session[:login_id] = user.id
  end

  def log_out
    session.delete(:login_id)
  end
end
