class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #debugger
  end

  def new
    @user = User.new()
  end

  def create
    # for some weird reason, self.fn() doesn't work
    # when fn() is private
    
    @user = User.new(user_params())
    if @user.save()
      # success
      self.log_in(@user)
      self.flash()[:success] = "Welcome to the Sample App"
      self.redirect_to(@user)
    else
      # unsuccessful
      self.render('new')
    end
  end

  private

  def user_params
    return params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

end
