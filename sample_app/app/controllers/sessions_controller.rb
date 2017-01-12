class SessionsController < ApplicationController

  def new
  end

  def create
    email = params[:session][:email].downcase
    user = User.find_by(:email => email)
    if user && user.authenticate(params[:session][:password])
      self.log_in(user)
      self.remember(user)
      self.redirect_to(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if (logged_in?)    
      self.log_out()
    end
    self.redirect_to(root_url)
  end
end