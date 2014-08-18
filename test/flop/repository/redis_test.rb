require 'test_helper'
require 'flop/repository/generic_repo_example'
require 'fakeredis'

class Flop::Repository::RedisTest < Minitest::Test
  def setup
    @repo = Flop::Repository::Redis.new(Redis.new)
  end

  include Flop::Repository::GenericRepoExample
end
