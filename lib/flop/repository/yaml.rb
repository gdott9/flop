require 'yaml'

module Flop
  class Repository
    class Yaml < Flop::Repository
      attr_reader :yaml, :namespace

      def initialize(yaml_file, namespace = 'flop')
        @yaml = YAML.load_file(yaml_file)
        @namespace = namespace
      end

      def get(name)
        name = name.to_s
        yaml[namespace].key?(name) ? yaml[namespace][name] : false
      end
    end
  end
end

