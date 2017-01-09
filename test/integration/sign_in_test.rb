require 'test_helper'

class SignInTest < ActionDispatch::IntegrationTest

  test 'should not login' do
    visit '/users/sign_out'
    visit '/users/sign_in'
    fill_in('user_email', with: 'john.doe@example.org')
    fill_in('user_password', with: 'secret')
    click_on('user_submit')
    assert page.has_content?('Invalid Email or password.')
  end

  test 'should login' do
    @user = create(:user)
    @user.save!
    visit '/users/sign_in'
    fill_in('user_email', with: @user.email)
    fill_in('user_password', with: @user.password)
    click_on('user_submit')
  end

end