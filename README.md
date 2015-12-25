# JAPI

![build status](https://travis-ci.org/djds23/jApi.svg?branch=master)

A simple ruby interface for the jservice.io API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'japi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install japi

## Usage

```ruby
clue = JAPI::Trebek.random.first # ask trebek for a random question!
puts clue.category.title # THE SOLAR SYSTEM
puts clue.question # Only 1 of 9 planets not named for a Greek or Roman mythological figure

answer = gets.chomp
if answer == clue.answer
  puts "The Earth! Correct!"
  puts "Good answer! Thats worth #{clue.value} dollars!"
else
  puts "Too bad!"
end
```

You can host your own jservice.io, and configure the gem to use arbitrary endpoints.

### Example Configuration

```ruby
require 'japi'

JAPI.configuration do |config|
 config.jservice_url = "http://my-selfhosted-jservice.com"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/djds23/japi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

