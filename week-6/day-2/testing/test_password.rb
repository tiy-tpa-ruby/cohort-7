require 'minitest/autorun'
require_relative 'password'

describe PasswordValidator do
  before do
    @password_validator = PasswordValidator.new
  end

  it "the password is not allowed if it is the same as when reversed" do
    the_same_when_reversed = "radar"

    assert_equal false, @password_validator.not_reversable?(the_same_when_reversed)
  end
end

class PasswordValidatorTest < Minitest::Test
  def setup
    # Setup
    @password_validator = PasswordValidator.new
  end

  def test_uppercase_with_uppercase_passwords
    # input
    password = "passworD"

    # executing the code
    # gathering output
    output = @password_validator.uppercase?(password)

    # making an expectation (assertion) against expected result
    assert_equal true, output
  end

  def test_uppercase_with_all_lowercase_passwords
    # input
    password = "password"

    # executing the code
    # gathering output
    output = @password_validator.uppercase?(password)

    # making an expectation (assertion) against expected result
    assert_equal false, output
  end

  def test_lowercase_with_an_all_uppercase_password
    # input
    password = "PASSWORD"

    # executing the code
    # gathering output
    output = @password_validator.lowercase?(password)

    # making an expectation (assertion) against expected result
    assert_equal false, output
  end

  def test_password_length_for_short_passwords
    short_password = "12345"
    assert_equal false, @password_validator.password_length?(short_password)
  end

  def test_password_length_at_short_password_boundary
    seven_character_password = "1234567"
    assert_equal false, @password_validator.password_length?(seven_character_password)
  end

  def test_password_length_at_long_enough_password_boundary
    eight_character_password = "12345678"
    assert_equal true, @password_validator.password_length?(eight_character_password)
  end

  def test_password_is_not_the_same_as_when_reversed_for_nonreversable_password
    not_the_same_thing_when_reversed = "567abcpizzaparty"

    assert_equal true, @password_validator.not_reversable?(not_the_same_thing_when_reversed)
  end

  def test_password_is_not_the_same_as_when_reversed_for_reversable_password
    the_same_when_reversed = "radar"

    assert_equal false, @password_validator.not_reversable?(the_same_when_reversed)
  end
end




#
