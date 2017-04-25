require 'test_helper'

class TagTest < ActiveSupport::TestCase

  should validate_presence_of :name
  should have_many :taggings
  should have_many :notes

end
