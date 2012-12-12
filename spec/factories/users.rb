# coding: utf-8

FactoryGirl.define do
  factory :user do
    sequence(:login_name) { |n| "user#{n}" }
    display_name { |user| user.login_name.capitalize }
    password "password"
    setting_password true
    after(:create) do |user, evaluator|
      FactoryGirl.create(:email, user: user)
    end
  end
end
