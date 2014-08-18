module Flop::Repository::GenericRepoExample
  def test_default_value_is_false
    refute @repo.get(:unknown_key), 'default value is not false'
  end

  def test_get_value
    @repo.set(:test, true)
    @repo.set(:test2, false)

    assert_equal true, @repo.get(:test)
    assert_equal false, @repo.get(:test2)
  end
end
