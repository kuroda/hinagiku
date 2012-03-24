class AccountsController < ApplicationController
  skip_before_filter :authenticate_user, :only => [ :new, :create, :verify ]
  skip_before_filter :reject_unverified_user

  def new
    @user = User.new
    @user.emails.build
  end

  def create
    @user = User.new(params[:user])
    @user.setting_password = true
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
      flash.notice = t("flash.accounts.update.notice")
      redirect_to :account
    else
      render :show
    end
  end

  def thanks
    @email = current_user.emails.first
  end
  
  def unverified
    @email = current_user.emails.first
  end
end
