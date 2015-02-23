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

  it 'test user can CRUD courses' do
    click_link "Sign In"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
    fill_in "Username", with: "countchocula123"
    fill_in "Password", with: "123456"
    click_button "Sign In"
    expect(page).to have_content "Courses Index"
    click_link "Courses Index"
    expect(page).to have_content "Add new course"
    click_link "Add new course"
    expect(page).to have_content "Title"
    expect(page).to have_content "Day class?"
    fill_in "Title", with: "Counting 101"
    click_button "Create Course"
    expect(page).to have_content "Counting 101"
    click_link "Edit Course"
    expect(page).to have_content "Edit this course"
    fill_in "Title", with: "Counting 123"
    click_button "Update Course"
    expect(page).to have_content "Counting 123"
    click_link "Delete Course"
    expect(page).to have_content "Courses Index"
  end


end
