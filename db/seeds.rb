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

names = [
  "切手を買う",
  "報告書を書く",
  "家賃を払う",
  "猫の餌を買う",
  "燃えないゴミを出す"
]

description = "これは説明です。" * 20

5.times do |n|
  Task.create({ :name => names[n], :description => description,
    :due_date => (n - 2).days.from_now, :done => n.zero?,
    :owner => users[0] }, :without_protection => true)
end

200.times do |n|
  Task.create({ :name => "Task #{n}", :description => description,
    :due_date => (n + 3).days.from_now, :done => false,
    :owner => users[1] }, :without_protection => true)
end

%w(仕事 生活 趣味).each do |name|
  Category.create({ :name => name, :owner => users[0] },
    :without_protection => true)
end

tasks = Task.order('id').limit(5).all
categories = Category.order('id').all

categories[1].tasks << tasks[0]
categories[0].tasks << tasks[1]
categories[1].tasks << tasks[2]
categories[1].tasks << tasks[4]
