# coding: utf-8

FactoryGirl.define do
  factory :email do
    user { FactoryGirl.create(:user) }
    address { "#{user.login_name}@example.com" }
    verified_at { Time.current }
  end
end
