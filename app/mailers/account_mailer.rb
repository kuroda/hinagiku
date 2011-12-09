# -*- encoding: UTF-8 -*-

class AccountMailer < ActionMailer::Base
  default :from => "info@example.com"
  
  def email_verification(user)
    @user = user
    mail(:to => user.email,
      :subject => '[Hinagiku] メールアドレスの確認')
  end
end
