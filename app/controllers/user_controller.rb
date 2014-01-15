class UserController < ApplicationController
  #before_filter :authenticate_user!

  def list
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

end
