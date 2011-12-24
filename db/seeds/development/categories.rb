# -*- encoding: UTF-8 -*-

alice = User.find_by_login_name('alice')

%w(仕事 生活 趣味).each do |name|
  Category.create({ :name => name, :owner => alice },
    :without_protection => true)
end

tasks = Task.order('id').limit(5).all
categories = Category.order('id').all

categories[1].tasks << tasks[0]
categories[0].tasks << tasks[1]
categories[1].tasks << tasks[2]
categories[1].tasks << tasks[4]
