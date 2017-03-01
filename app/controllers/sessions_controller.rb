class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    render :text => auth_hash.inspect
    # begin
    #   @user = User.from_omniauth(request.env['omniauth.auth'])
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome, #{@user.name}!"
    # rescue
    #   flash[:warning] = "There was an error while trying to authenticate you..."
    # end
    # redirect_to root_path
  end
    # begin
    #   @user = User.from_omniauth(request.env['omniauth.auth'])
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome, #{@user.name}!"
    # rescue
    #   flash[:warning] = "There was an error while trying to authenticate you..."
    # end
    # redirect_to root_path
# end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to '/'
  end

end
