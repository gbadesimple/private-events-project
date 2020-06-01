class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def show
    @user = User.find(params[:id])
    @prev_events = @user.previous_events
    @upcoming_events = @user.upcoming_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.name.capitalize!
    @user.email.downcase!
    @user.username.downcase!

    if @user.save

      flash.notice = "Account Successfully created!"
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end
