class InitialEmailsController < ApplicationController
  skip_before_filter :reject_unverified_user
  before_filter do
    redirect_to :root if current_user.verified?
  end
  
  def edit
    @email = current_user.emails.order('id').first    
  end
  
  def update
    @email = current_user.emails.order('id').first    
    @email.attributes = params[:email]
    if @email.save
      AccountMailer.email_verification(@email).deliver
      redirect_to :action => :updated
    else
      render :edit
    end
  end
  
  def updated
    @email = current_user.emails.order('id').first
  end
end
