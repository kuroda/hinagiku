class ApplicationController < ActionController::Base
  protect_from_forgery
  clear_helpers
  
  before_filter :authenticate_user
  
  rescue_from Exception, :with => :render_500
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::RoutingError, :with => :render_404
  
  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    elsif cookies.signed[:user_id]
      @current_user ||= User.find_by_id_and_auto_login_token(
        cookies.signed[:user_id], cookies.signed[:auto_login_token])
    end
  end
  helper_method :current_user
  
  def authenticate_user
    redirect_to :new_session unless current_user
  end

  def render_404(exception)
    raise exception unless Rails.env.production?
    render "errors/not_found", :status => 404
  end

  def render_500(exception)
    raise exception unless Rails.env.production?
    render "errors/internal_server_error", :status => 500
  end
end
