%w(alice bob carol).each_with_index do |name, index|
  user = User.new
  user.login_name = name
  user.display_name = name.capitalize
  user.password = "opensesame!"
  user.setting_password = true
  user.save!
  email = Email.new(
    :address => user.login_name + "@example.com")
  email.verified_at = Time.current if index <= 1
  user.emails << email
end
