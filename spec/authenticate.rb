require File.expand_path("../../config/environment", __FILE__)
require_relative 'rails_helper'


describe "the signin process", js: true, type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

   it "sign up" do
    visit '/users/sign_up'
    find('#user_email').set('jefferson@riverstonetech.com')
    find('#user_password').set('ABcd12..')
    find('#user_password_confirmation').set('ABcd12..')
    click_button 'Sign up'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Welcome to the demo app'
  end

  # it "signs me in" do
  #   visit '/users/sign_in'
  #   find('#user_email').set('jefferson@riverstonetech.com')
  #   find('#user_password').set('ABcd12..')
  #   click_button 'Log in'
  #   # print page.driver.debug 
  #   # p page.status_code
  #   expect(page.current_path).to eq root_path
  # end
end