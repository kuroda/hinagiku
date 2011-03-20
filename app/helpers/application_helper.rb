# -*- encoding: UTF-8 -*-

module ApplicationHelper
  def delete_link(object)
    link_to "削除", object, :method => :delete,
      :confirm => "本当に削除しますか？"
  end

  def error_messages(object, attribute)
    full_messages = []
    object.errors[attribute].each do |message|
      text = I18n.t("errors.format",
        :attribute => object.class.human_attribute_name(attribute),
        :message => message)
      full_messages << content_tag(:p, text, :class => 'error_message')
    end
    full_messages.join().html_safe
  end
end
