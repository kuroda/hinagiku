module TasksHelper
  def links_for(task)
    links = []
    links << link_to("修正", [ :edit, task ])
    if task.done?
      links << link_to("戻す", [ :unfinish, task ], :method => :put)
    else
      links << link_to("完了", [ :finish, task ], :method => :put)
    end
    links << delete_link(task)
    raw(links.join(" "))
  end
end
