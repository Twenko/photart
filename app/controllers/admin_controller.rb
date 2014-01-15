class AdminController < ApplicationController
  before_filter :authenticate_admin!
  def list
    @admins = Admin.all
  end

  def show
  end

end
