module Flop
  class Repository
    def get(name)
      raise GetNotImplemented
    end

    def set(name, value)
      raise SetNotImplemented
    end

    GetNotImplemented = Class.new(StandardError)
    SetNotImplemented = Class.new(StandardError)
  end
end
