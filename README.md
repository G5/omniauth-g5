# G5 OmniAuth

This is the [OmniAuth][omniauth] strategy for authenticating to G5 via
[OAuth 2.0][oauth].

 [omniauth]: https://github.com/intridea/omniauth
 [oauth]: http://oauth.net/2/

## Requirements

* A G5 Application ID and secret
* Add the G5 private gem server at gemfury as a gem source

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-g5'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-g5

## Usage

The strategy must be initialized with a valid application ID and application
secret provided by the G5 auth service. For example, to use the G5 strategy
with [devise][devise]:

    Devise.setup do |config|
      config.omniauth :g5, ENV['G5_APP_ID'], ENV['G5_APP_SECRET']
    end

For more general information about setting up and using OmniAuth, see the
[official OmniAuth documentation][omniauth-wiki].

 [devise]: https://github.com/plataformatec/devise
 [omniauth-wiki]: https://github.com/intridea/omniauth/wiki

## Authors

  * Maeve Revels / [@maeve](https://github.com/maeve)
  * Rob Revels / [@sleverbor](https://github.com/sleverbor)

## Contributing

1. Fork it
2. Get it running
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Write your code and **specs**
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/g5search/omniauth-g5/issues).
