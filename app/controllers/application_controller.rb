class ApplicationController < ActionController::Base
  protect_from_forgery
  #protect_from_forgery with: :exception
  before_filter :get_locale
  #before_filter :configure_permitted_parameters, if: :devise_controller?
  def get_locale
    @utili = nil
    if current_user
      @utili = current_user
    end
    if current_admin
      @utili = current_admin
    end
    locale = @utili.locale rescue locale = nil
  end
  #protected

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nick, :username, :$
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:nick, :email) }
  #  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, $
  #  devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :name, :nic$
  #end

end
