class PasswordValidator

  def not_reversable?(password)
    password != password.reverse
  end

  # - one uppercase
  def uppercase?(password)
    ('A'..'Z').any? { |uppercase_letter| password.include?(uppercase_letter) }
  end

  # - one lowercase
  def lowercase?(password)
    ('a'..'z').any? { |lowercase_letter| password.include?(lowercase_letter) }
  end

  # - one number
  def has_a_number?(password)
    ('0'..'9').any? { |digit| password.include?(digit) }
  end

  # - and one of these %w{* / ? ! , #}
  def has_a_special_character?(password)
    %w{* / ? ! , #}.any? { |special_character| password.include?(special_character) }
  end

  # Must be at least 8 .. 20 characters long
  def password_length?(password)
    password.length >= 8 && password.length <= 20
  end

  # No spaces
  def no_spaces?(password)
    !password.include?(" ")
  end

  # Cannot contain user name
  def no_user_name?(password, user_name)
    !password.include?(user_name)
  end
end
