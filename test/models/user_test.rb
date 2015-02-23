require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      name: "Example User", 
      email: "user@example.com", 
      password: "foobar123", 
      password_confirmation: "foobar123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should be shorter that 255 characters" do
    @user.name = "a" * 256
    assert_not @user.valid?
  end

  test "email should be shorter that 255 characters" do
    @user.email = "a" * 250 + "@address.com"
    assert_not @user.valid?
  end

  test "invalid email addresses should not be accepted" do
    @user.email = "example.com"
    assert_not @user.valid?
  end

  test "email address should be unique" do
    user2 = @user.dup
    @user.save
    assert_not user2.valid?
  end

  test "password should have a minimum length of 8" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end 
end
