class AccountsController < ApplicationController
  skip_before_filter :reject_visitors,
    :only => [ :new, :create, :verify ]
  
  def show
  end
  
  def new
    @user = User.new
    @user.emails.build
  end
  
  def edit
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      AccountMailer.email_verification(@user.emails.first).deliver
      session[:user_id] = @user.id
      redirect_to :action => :thanks
    else
      render :new
    end
  end
  
  def update
    if current_user.update_attributes(params[:user])
      redirect_to :account
    else
      render :edit
    end
  end
  
  def thanks
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
