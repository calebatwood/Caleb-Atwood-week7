require 'rails_helper'

describe 'users' do
  before :each do
    visit users_path
    click_link "Sign Up"
    expect(page).to have_content "Sign up for school"
    fill_in "Username", with: "countchocula123"
    fill_in "About", with: "I love numbers, ah, ah, ah"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign Up"
    expect(page).to have_content "Courses Index"
    click_link "Sign Out"
  end

  it 'goes to user index' do
    expect(page).to have_content "countchocula123"
  end

  it 'valid user can login' do
    click_link "Sign In"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
    fill_in "Username", with: "countchocula123"
    fill_in "Password", with: "123456"
    click_button "Sign In"
    expect(page).to have_content "Courses Index"
  end
end
