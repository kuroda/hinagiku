class EmailsController < ApplicationController
  skip_before_filter :authenticate_user, :only => [ :verify ]
  
  def verify
    @email = Email.find_by_id(params[:id])
    if @email.try(:verification_token) == params[:token]
      @email.update_attribute(:verified_at, Time.current)
      render :verified
    else
      render :not_verified
    end
  end
end
