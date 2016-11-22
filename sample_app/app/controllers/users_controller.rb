class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #debugger
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(self.user_params())
    if @user.save()
      # success
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
