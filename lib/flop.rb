require 'flop/version'

require 'flop/feature'

require 'flop/repository'
require 'flop/repository/memory'
require 'flop/repository/redis'
require 'flop/repository/yaml'

module Flop
  class << self
    attr_writer :repo

    def repo
      @repo ||= Flop::Repository::Memory.new
    end

    def [](feature)
      Flop::Feature.new(feature)
    end
  end
end
