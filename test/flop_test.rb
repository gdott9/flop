require 'test_helper'

class FlopTest < Minitest::Test
  def test_that_return_feature
    assert_instance_of Flop::Feature, Flop[:test]
  end
end
