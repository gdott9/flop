require 'test_helper'

class Flop::RepositoryTest < Minitest::Test
  def setup
    @repo = Flop::Repository.new
  end

  def test_get_raises_exception
    assert_raises(Flop::Repository::GetNotImplemented) do
      @repo.get(:test)
    end
  end

  def test_set_raises_exception
    assert_raises(Flop::Repository::SetNotImplemented) do
      @repo.set(:test, true)
    end
  end
end
