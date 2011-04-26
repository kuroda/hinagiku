# -*- encoding: UTF-8 -*-

module TasksHelper
  def links_for(task)
    links = []
    links << link_to("修正", [ :edit, task ])
    if task.done?
      links << link_to("戻す", [ :restart, task ], :method => :put)
    else
      links << link_to("完了", [ :finish, task ], :method => :put)
    end
    links << delete_link(task)
    raw(links.join(" "))
  end
  
  def category_options
    options = [ [ "----", nil ] ]
    Category.all.each do |c|
      options << [ c.name, c.id ]
    end
    options
  end
end
