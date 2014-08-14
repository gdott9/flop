module Flop
  module Repository
    class Redis
      def initialize(redis, namespace = '')
        @redis = redis
        @namespace = namespace
      end

      def get(name)
        @redis.get(key(name)).to_i == 1
      end

      def set(name, value)
        @redis.set(key(name), value ? 1 : 0)
      end

      private

      def key(name)
        [@namespace, name].join(':')
      end
    end
  end
end
