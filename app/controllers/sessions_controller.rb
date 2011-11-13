class SessionsController < ApplicationController
  skip_before_filter :reject_visitors
  
  def create
    user = User.find_by_login_name(params[:login_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to :new_session
  end
end