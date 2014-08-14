module Flop
  module Repository
    class Memory
      attr_accessor :features

      def initialize
        self.features = Hash.new(false)
      end

      def get(name)
        features[name]
      end

      def set(name, value)
        features[name] = value
      end
    end
  end
end
