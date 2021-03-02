require 'pry'
class UsersController < ApplicationController
  def new
  end

  def create
    redirect_to users_new_path if params[:user][:password] != params[:user][:password_confirmation]
    user = User.create(user_params)
    session[:user_id] = user.id
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
