require 'test_helper'

class Flop::FeatureTest < Minitest::Test
  def setup
    @feature = Flop::Feature.new(:test)
  end

  def test_it_is_inactive_by_default
    assert Flop::Feature.new(:inactive_feature).inactive?
  end

  def test_that_name_is_symbol
    assert_equal :string, Flop::Feature.new('string').name
  end

  def test_set_specified_value
    @feature.set true
    assert @feature.active?

    @feature.set false
    assert @feature.inactive?
  end

  def test_toggle
    @feature.deactivate

    @feature.toggle
    assert @feature.active?
  end

  def test_activate
    @feature.activate
    assert @feature.active?
  end

  def test_deactivate
    @feature.deactivate
    assert @feature.inactive?
  end

  def test_with_executes_block
    @feature.deactivate
    assert_nil @feature.with { true }

    @feature.activate
    assert @feature.with { true }
  end

  def test_without_executes_block
    @feature.deactivate
    assert @feature.without { true }

    @feature.activate
    assert_nil @feature.without { true }
  end
end
