# -*- encoding: UTF-8 -*-

users = []
users << User.create(:login_name => 'alice', :password => 'hotyoga')
users << User.create(:login_name => 'bob', :password => 'tiger')
users << User.create(:login_name => 'carol', :password => 'ocean')

users.each do |user|
  user.emails << Email.new(
    :address => user.login_name + '@example.com')
end

users[0].emails.first.update_attribute(:verified_at, Time.current)
users[1].emails.first.update_attribute(:verified_at, Time.current)
