# Shouhizei

This gem support to calculate Japan consumption tax

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shouhizei'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shouhizei

## Usage

You can get Japanese excise tax rate like below.

```ruby
Shouhizei.rate_on(Date.new(1989, 3, 31))
 => (0/1)

Shouhizei.rate_on(Date.new(1989, 4, 1))
 => (3/100)

Shouhizei.rate_on(Date.new(1997, 4, 1))
 => (1/20)

Shouhizei.rate_on(Date.new(2014, 4, 1))
 => (2/25)

Shouhizei.rate_on()
 => (2/25)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/shouhizei. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Shouhizei project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/shouhizei/blob/master/CODE_OF_CONDUCT.md).
