# coding: utf-8

require 'spec_helper'

describe User, '#authenticate' do
  context "パスワードが正しい場合" do
    it "trueを返す" do
      password = 'himitsu'
      user = FactoryGirl.create(:user, password: password)
      expect(user.authenticate(password)).to be_true
    end
  end

  context "パスワードが正しくない場合" do
    it "falseを返す" do
      password = 'himitsu'
      wrong_password = 'secret'
      user = FactoryGirl.create(:user, password: password)
      expect(user.authenticate(wrong_password)).to be_false
    end
  end
end
