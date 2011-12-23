class PasswordsController < ApplicationController
  skip_before_filter :reject_unverified_user

  def edit
  end
  
def update
  current_user.attributes = params[:user]
  current_user.changing_password = true
  if current_user.save
    redirect_to :action => :updated
  else
    render :edit
  end
end
  
  def updated
  end
end
