# -*- encoding: UTF-8 -*-

class AccountMailer < ActionMailer::Base
  default :from => "info@example.com"
  
  def email_verification(email)
    @user = email.user
    mail(:to => email.address,
      :subject => '[Hinagiku] メールアドレスの確認')
  end
end
