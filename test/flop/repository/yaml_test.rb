require 'test_helper'

class Flop::Repository::YamlTest < Minitest::Test
  def setup
    @repo = Flop::Repository::Yaml.new('test/fixtures/features.yml')
  end

  def test_set_raises_exception
    assert_raises(Flop::Repository::SetNotImplemented) do
      @repo.set(:test, true)
    end
  end

  def test_default_value_is_false
    refute @repo.get(:unknown_key), 'default value is not false'
  end

  def test_get_value_with_default_namespace
    assert_equal true, @repo.get(:blog)
    assert_equal false, @repo.get(:wiki)
  end
end
