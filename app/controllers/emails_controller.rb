class EmailsController < ApplicationController
  skip_before_filter :authenticate_user, :only => [ :verify ]
  skip_before_filter :reject_unverified_user
  
  def update
    @email = current_user.emails.find(params[:id])
    @email.attributes = params[:email]
    if @email.save
      AccountMailer.email_verification(@email).deliver
      redirect_to [ :updated, @email ]
    else
      render "accounts/unverified"
    end
  end

  def updated
    @email = current_user.emails.find(params[:id])
  end
  
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
