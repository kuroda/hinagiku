class PasswordRecoveryController < ApplicationController
  skip_before_filter :authenticate_user, :reject_unverified_user
  
  # GET
  def start
  end
  
  # POST
  def send_token
    user = User.find_by_login_name(params[:login_name])
    if user && user.emails.find_by_address(params[:email])
      # Not yet implemented.
    end
  end
  
  # GET
  def continue
  end
  
  # POST
  def execute
  end
  
  # GET
  def done
  end 
end
