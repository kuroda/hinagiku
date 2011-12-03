class AccountsController < ApplicationController
  def show
  end
  
  def edit
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to :account
    else
      render :edit
    end
  end
end
