class UserController < ApplicationController
  #before_filter :authenticate_user!

  def list
    #@users = User.all
    @users = User.order("created_at").page(params[:page]).per(25)

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def usprofil
    
  end

end
