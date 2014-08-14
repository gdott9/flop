require 'flop/version'

require 'flop/feature'
require 'flop/repository/memory'

module Flop
  class << self
    attr_accessor :repo

    def [](feature)
      Flop::Feature.new(feature)
    end
  end
end
