module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Remembers user in a persistent session
  def remember(user)
    #debugger
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    user_id = session[:user_id]
    if (user_id)
      @current_user ||= User.find_by(id: user_id)
    else
      # elsif (user_id = cookies.signed[:user_id])
      user_id = cookies.signed[:user_id]
      if (user_id)
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end

  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
end
