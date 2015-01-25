class UsersController < ApplicationController

  def index
    @users = User.all	
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    #@role = Role.find(params[:role_id])
    @user = User.new

  end


  def user_params
    params.require(:user).permit(:userName, :email, :isActive, :password, :role_id)
  end

  def create

    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, :notice => 'success: ' + @user.email + ' created successfully'
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
      redirect_to users_path, :notice => 'success: The user has been updated successfully'
    else
      render 'edit', :notice => 'danger: something bad happened'
    end
	
  end
  def destroy
    @user = User.find(params[:id])
    messageString = 'success: User ' + @user.email + ' deleted successfully'
    @user.destroy
    redirect_to users_path, :notice => messageString
  end
end
