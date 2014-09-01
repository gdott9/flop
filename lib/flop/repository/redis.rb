module Flop
  class Repository
    class Redis < Flop::Repository
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
        [namespace, name].flatten.join(':')
      end

      def namespace
        @namespace.is_a?(Proc) ? @namespace.call : @namespace
      end
    end
  end
end
