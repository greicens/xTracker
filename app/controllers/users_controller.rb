class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      login(user)
      redirect_to user_path(user)
    else
      user.errors.full_messages.each do |message|
        flash[:error] = message
      end
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      user.errors.full_messages.each do |message|
        flash[:error] = message
      end
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :username,  :password, :name)
  end

end
