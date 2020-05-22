class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      flash.notice = "Account Successfully created!"
      redirect_to @user
    else
      render :new
  end


  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end


end
