# -*- encoding: UTF-8 -*-

alice = User.find_by_login_name('alice')
bob = User.find_by_login_name('bob')

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
    :owner => alice }, :without_protection => true)
end

200.times do |n|
  Task.create({ :name => "Task #{n}", :description => description,
    :due_date => (n + 3).days.from_now, :done => false,
    :owner => bob }, :without_protection => true)
end
