class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Kaizen!"
      # could use redirect_to @user or redirect_to user_url(@user)
      redirect_to @user
    else
      render 'new'
    end
  end





  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :sex, :email, :phone, :role, :password, :password_confirmation)
  end
end
