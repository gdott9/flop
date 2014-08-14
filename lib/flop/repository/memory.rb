module Flop
  module Repository
    class Memory
      def initialize
        @features = Hash.new(false)
      end

      def get(name)
        @features[name]
      end

      def set(name, value)
        @features[name] = value
      end
    end
  end
end
