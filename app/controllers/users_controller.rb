class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])

    if current_user != @user
      redirect_to root_path, notice: 'Sorry, but you are only allowed to view your own profile page.'
  end
  end
end
