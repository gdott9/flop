# Flop

A simple ruby feature flipper.

## Installation

Add this line to your application's Gemfile:

    gem 'flop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flop

## Usage

### Repositories

First, you need to configure where to store everything by setting a repository.

Available repositories are :
- `Flop::Repository::Memory`
- `Flop::Repository::Redis`

To set the repository, create a new object and affect it to `Flop.repo`.
```ruby
Flop.repo = Flop::Repository::Memory.new

require 'redis'

Flop.repo = Flop::Repository::Redis.new(Redis.new)
```

### Features

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
