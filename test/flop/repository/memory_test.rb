require 'test_helper'
require 'flop/repository/generic_repo_example'

class Flop::Repository::MemoryTest < Minitest::Test
  def setup
    @repo = Flop::Repository::Memory.new
  end

  include Flop::Repository::GenericRepoExample
end
