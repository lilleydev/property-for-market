class UsersController < ApplicationController
  # before_action :set_user, only: %i[show]
  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def set_user
    binding.pry
    @user = User.find(params[:id])
  end
end
