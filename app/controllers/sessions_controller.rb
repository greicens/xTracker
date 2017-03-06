class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
     @user = User.confirm(user_params)
     if @user
       login(@user)
       flash[:notice] = "Successfully logged in."
       redirect_to @user
     else

       flash[:login_error] = "Incorrect email or password"
       redirect_to login_path
     end
  end

  def create_with_facebook
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_uid(auth_hash.uid)
    
   if @authorization
     @user = User.find_by_id(@authorization.user_id)
     login(@user)
     flash[:notice] = "Successfully logged in."
     redirect_to dashboard_path
   else
     @authorization = Authorization.create(provider: auth_hash.provider,
                                            uid: auth_hash.uid)
     @user = User.create(name: auth_hash.info.name,
                         email: auth_hash.info.email,
                         password: "facebook",
                         username: auth_hash.info.name)
    @user.authorizations << @authorization


     login(@user)
     flash[:notice] = "Successfully logged in."

     redirect_to dashboard_path
   end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to '/'
  end

end
