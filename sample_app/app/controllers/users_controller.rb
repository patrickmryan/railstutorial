class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [        :edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      self.redirect_to(@user)
    else
      render 'edit'
    end
  end

  def destroy
    dead_man_walking = User.find(params[:id])
    dead_man_walking.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private

  def user_params
    return params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  # before filters

  def logged_in_user
    unless logged_in?
      self.store_location()
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
    theUser = current_user
    
 #   print "admin_user: theUser = ", theUser.to_s, "\n"
    
  #  redirect_to(root_url) unless (theUser && theUser.admin?)
    redirect_to(root_url) unless (theUser.admin?)

  end

end
