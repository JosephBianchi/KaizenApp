require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should be valid" do
    joseph = build(:user)
    alex = build(:user, :alex)
    assert joseph.valid?
  end

  test "first_name should be present" do
    joseph = build(:user)
    joseph.first_name = "     "
    assert_not joseph.valid?
  end

  test "email should be present" do
    joseph = build(:user)
    joseph.email = "     "
    assert_not joseph.valid?
  end

  test "first_name should not be too long" do
    joseph = build(:user)
    joseph.first_name = "a" * 244
    assert_not joseph.valid?
  end

  test "last_name should not be too long" do
    joseph = build(:user)
    joseph.last_name = "a" * 244
    assert_not joseph.valid?
  end

  test "email should not be too long" do
    joseph = build(:user)
    joseph.email = "a" * 244
    assert_not joseph.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      joseph = build(:user)
      joseph.email = valid_address
      assert joseph.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      joseph = build(:user)
      joseph.email = invalid_address
      assert_not joseph.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    joseph = build(:user)
    duplicate = joseph.dup
    duplicate.email.downcase
    joseph.save
    assert_not duplicate.valid?
  end

  test "email addresses should be saved as lower-case" do
   mixed_case_email = "Foo@ExAMPle.CoM"
   joseph = build(:user)
   joseph.email = mixed_case_email
   joseph.save
   assert_equal mixed_case_email.downcase, joseph.reload.email
  end

  test "password should be present (nonblank)" do
    joseph = build(:user)
    joseph.password = joseph.password_confirmation = " " * 6
    assert_not joseph.valid?
  end

  test "password should have a minimum length" do
    joseph = build(:user)
    joseph.password = joseph.password_confirmation = "j" * 5
    assert_not joseph.valid?
  end




end
