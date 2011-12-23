class PasswordRecoveryController < ApplicationController
  skip_before_filter :authenticate_user, :reject_unverified_user
end
