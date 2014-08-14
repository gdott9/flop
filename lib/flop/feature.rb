module Flop
  class Feature
    attr_accessor :name, :repo

    def initialize(name, repo = Flop.repo)
      self.name = name.to_sym
      self.repo = repo
    end

    def active?
      repo.get(name)
    end

    def inactive?
      !active?
    end

    def set(value)
      repo.set(name, value)
    end

    def activate
      set true
    end

    def deactivate
      set false
    end

    def toggle
      set !active?
    end

    def with(&block)
      yield block if active?
    end

    def without(&block)
      yield block if inactive?
    end
  end
end
