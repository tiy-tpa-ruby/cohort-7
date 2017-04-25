require 'test_helper'

class TaggingTest < ActiveSupport::TestCase

  should belong_to :tag
  should belong_to :note

end
