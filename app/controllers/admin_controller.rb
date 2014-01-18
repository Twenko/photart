class AdminController < ApplicationController
  before_filter :authenticate_admin!
  def list
    #@admins = Admin.all
    @admins = Admin.order("id").page(params[:page]).per(15)
  end

  def show
  end

end
