description = "これは説明です。" * 20
Task.create(:name => "Taks 0", :description => description,
            :due_date => Date.today, :done => true)

1.upto(200) do |n|
  Task.create(:name => "Task #{n}", :description => description,
              :due_date => n.days.from_now, :done => false)
end
