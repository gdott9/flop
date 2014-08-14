require 'flop/version'

require 'flop/feature'
require 'flop/repository/memory'
require 'flop/repository/redis'

module Flop
  class << self
    attr_accessor :repo

    def [](feature)
      Flop::Feature.new(feature)
    end
  end
end
