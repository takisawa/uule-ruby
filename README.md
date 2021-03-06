# Uule [![Build Status](https://travis-ci.org/takisawa/uule-ruby.svg)](http://travis-ci.org/takisawa/uule-ruby)

Manage uule parameter for Google Local Search.

References:
  - https://moz.com/ugc/geolocation-the-ultimate-tip-to-emulate-local-search
  - https://developers.google.com/adwords/api/docs/appendix/geotargeting

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uule'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uule

## Usage

```
require 'uule'

# Generate uule parameter from location canonical name.
Uule.encode('Sapporo,Hokkaido,Japan') # => 'w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg=='

# Generate location canonical name from uule parameter.
Uule.decode('w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg==' # => 'Sapporo,Hokkaido,Japan'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takisawa/uule-ruby

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
