require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    # assert_no_difference - assert_equals beofore_count and after_count
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name: "Steve", last_name: "black", age: 25, sex: "male", email: 'jb@gmail.com', phone: "8999999", role: "mentor", password: "password", password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end
end
