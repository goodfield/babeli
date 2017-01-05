require 'test_helper'

class SignInTest < ActionDispatch::IntegrationTest

  test 'should not login' do
    visit '/users/sign_out'
    visit '/users/sign_in'
    fill_in('Email', with: 'john.doe@example.org')
    fill_in('Password', with: 'secret')
    click_on('Log in')
    assert page.has_content?('Invalid Email or password.')
  end

  test 'should login' do
    @user = create(:user)
    @user.save!
    visit '/users/sign_in'
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_on('Log in')
  end

end