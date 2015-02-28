require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid user information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {
        name: "", 
        email: "invalid@email", 
        password: "pass", 
        password_confirmation: "pass21"}
    end
    assert_template 'users/new'
  end
end
