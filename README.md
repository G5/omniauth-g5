# G5 OmniAuth

This is the [OmniAuth][omniauth] strategy for authenticating to G5 via
[OAuth 2.0][oauth].

 [omniauth]: https://github.com/intridea/omniauth
 [oauth]: http://oauth.net/2/

## Current version

0.0.2

## Requirements

* G5 Auth client credentials

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-g5'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-g5

## Usage

The strategy must be initialized with a valid client application ID and secret
provided by the G5 auth service. For example, to use the G5 strategy with
[devise][devise]:

    Devise.setup do |config|
      config.omniauth :g5, ENV['G5_AUTH_CLIENT_ID'], ENV['G5_AUTH_CLIENT_SECRET']
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

### Specs

Just execute:

    $ bundle exec rspec spec

## License

Copyright (c) 2013 G5

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
