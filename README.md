# Flop

Flop is a feature flipper gem for ruby.

Toggle features on and off easily and store feature states in memory or in redis
with the different repositories.

## Installation

Add this line to your application's Gemfile:

    gem 'flop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flop

## Repositories

First, you need to configure where to store everything by setting a repository.

Available repositories are :
- `Flop::Repository::Memory`
- `Flop::Repository::Redis`
- `Flop::Repository::Yaml`

To set the repository, create a new object and affect it to `Flop.repo`.
```ruby
Flop.repo = Flop::Repository::Memory.new

require 'redis'

Flop.repo = Flop::Repository::Redis.new(Redis.new)
```

### Redis

The `Redis` repository requires a `Redis` connection as its first parameter.
The default namespace can be passed as a second parameter.

The default namespace can be a string, an array or a proc.

```ruby
Flop::Repository::Redis.new(Redis.new, "flop:namespace")
Flop::Repository::Redis.new(Redis.new, [:flop, :namespace])
Flop::Repository::Redis.new(Redis.new, -> { ENV['NAMESPACE'] })
```

### YAML

The `Yaml` repository requires a yaml file as its first parameter.
This repository is read-only so methods like `activate`, `toggle`, ... can not be used.

```ruby
Flop::Repository::Yaml.new('my_file.yml')
```

## Features

To access a feature, you can call the Flop[] method or create a new `Flop::Feature` object.
```ruby
Flop[:example_feature] # is the same as
Flop::Feature.new(:example_feature)
```

Available methods on `Flop::Feature` are :
- `feature.active?` returns true if the feature is active
- `feature.inactive?` returns true if the feature is inactive
- `feature.set(boolean)` sets the state of the feature to the passed value
- `feature.activate` activates the feature
- `feature.deactivate` deactivates the feature
- `feature.toggle` toggles the state of the feature
- `feature.with { }` executes the block if the feature is active
- `feature.without { }` executes the block if the feature is inactive

## Examples

```ruby
Flop.repo = Flop::Repository::Memory.new

Flop[:feature].active? # => false
Flop[:feature].toggle # => true

Flop[:feature].with do
  # code
end
```

## Contributing

1. Fork it ( https://github.com/gdott9/flop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
