require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    user = User.find_by(name: params['user']['name'])
    authenticated = user.try(:authenticate, params[:user][:password])
    return head(:forbidden) unless authenticated
    @user = user
    session[:user_id] = @user.id
    
  end

end
