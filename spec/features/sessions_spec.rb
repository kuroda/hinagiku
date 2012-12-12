# coding: utf-8

require 'spec_helper'

feature 'ログイン名とパスワードでログイン' do
  let(:password) { "password" }
  let(:wrong_password) { "secret" }
  let(:user) { FactoryGirl.create(:user, password: password) }

  scenario '成功' do
    visit root_path
    fill_in 'ログイン名', with: user.login_name
    fill_in 'パスワード', with: password
    click_button 'ログイン'
    expect(page).to have_css('p.flash_notice', text: 'ログインしました。')
  end

  scenario '失敗' do
    visit root_path
    fill_in 'ログイン名', with: user.login_name
    fill_in 'パスワード', with: wrong_password
    click_button 'ログイン'
    expect(page).to have_css('p.flash_alert',
      text: 'ログイン名またはパスワードが正しくありません。')
  end
end
