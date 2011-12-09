class AccountsController < ApplicationController
  skip_before_filter :reject_visitors, :only => [ :new, :create ]
  
  def show
  end

  def new
    @user = User.new
  end
  
  def edit
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      AccountMailer.email_verification(@user).deliver
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
end
