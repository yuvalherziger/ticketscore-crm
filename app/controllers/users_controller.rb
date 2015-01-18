class UsersController < ApplicationController

  def index
    @users = User.all	
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:userName, :email, :isActive, :password)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, :notice => 'success: User created successfully'
    else
      render 'new', :notice => 'danger: Please review the errors below'
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => 'success: The user has been updated sucessfully'
    else
      render 'edit', :notice => 'danger: something bad happenned'
    end
	
  end
  def destroy

  end
end
