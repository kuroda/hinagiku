# -*- encoding: UTF-8 -*-

module CategoriesHelper
  def links_for(category)
    links = []
    links << link_to("修正", [ :edit, category ])
    links << delete_link(category)
    raw(links.join(" "))
  end
end
