class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @error = 'Incorrect email and/or password'
      render new_user_registration_path
    end
  end

  def google
    u = User.find_or_create_with_oauth(auth)
    session[:user_id] = u.id

    redirect_to '/login'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
