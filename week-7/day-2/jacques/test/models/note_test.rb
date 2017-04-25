require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  should have_many :taggings
  should have_many :tags

  should validate_presence_of :title
  should validate_presence_of :body

end
