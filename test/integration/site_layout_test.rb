require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
  end

  test "layout links when logged in" do
    sign_in @user
    get root_path
    assert_select "a[href=?]", new_user_registration_path, text: 'Sign up', count: 0
    assert_select "a[href=?]", new_user_session_path, text: 'Login', count: 0
    assert_select "a[href=?]", edit_user_registration_path, text: 'Edit profile'
    assert_select "a[href=?]", destroy_user_session_path, text: 'Logout'
  end

  test "layout links when not logged in" do
    get root_path
    assert_select "a[href=?]", new_user_registration_path, text: 'Sign up'
    assert_select "a[href=?]", new_user_session_path, text: 'Login'
    assert_select "a[href=?]", edit_user_registration_path, text: 'Edit profile', count: 0
    assert_select "a[href=?]", destroy_user_session_path, text: 'Logout', count: 0
  end
end
