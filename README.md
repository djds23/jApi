# Jeopardy 

# RENAME AND FIX THESE TO BE jApi
bin/console
4:require "jeopardy"

Gemfile
3:# Specify your gem's dependencies in jeopardy.gemspec

jeopardy.gemspec
4:require 'jeopardy/version'
7:  spec.name          = "jeopardy"
8:  spec.version       = Jeopardy::VERSION

lib/jeopardy/version.rb
1:module Jeopardy

lib/jeopardy.rb
1:require "jeopardy/version"
2:require "jeopardy/trebek"
3:require "jeopardy/clue"
6:module Jeopardy

README.md
1:# Jeopardy
7:Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/jeopardy`. To experiment with that code, run `bin/console` for an interactive prompt.
16:gem 'jeopardy'
25:    $ gem install jeopardy
39:Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jeopardy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

spec/jeopardy_spec.rb
3:describe Jeopardy do
5:    expect(Jeopardy::VERSION).not_to be nil

spec/spec_helper.rb
2:require 'jeopardy'

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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/djds23/japi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

