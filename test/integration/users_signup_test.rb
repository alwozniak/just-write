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

  test "valid user information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {
        name: "Name",
        email: "email@email.com",
        password: "alamakota",
        password_confirmation: "alamakota"
      }
    end
    assert_template 'users/show'
  end
end
