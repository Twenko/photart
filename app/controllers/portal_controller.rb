class PortalController < ApplicationController
  before_filter :authenticate_admin!, :except => [:home]

  def home
    @articles = Article.find(:all, :conditions => ["activate = ?", true], :order => "created_at")
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
  end

  def admin
  end

end
