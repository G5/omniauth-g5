# G5 OmniAuth

This is the [OmniAuth][omniauth] strategy for authenticating to G5 via
[OAuth 2.0][oauth].

 [omniauth]: https://github.com/intridea/omniauth
 [oauth]: http://oauth.net/2/

## Current version

0.1.0

## Requirements

* G5 Auth client credentials

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-g5'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install omniauth-g5
```

## Usage

### Configuration

The strategy must be initialized with a valid client application ID and secret
provided by the G5 auth service. For example, to use the G5 strategy with
[devise][devise]:

```ruby
Devise.setup do |config|
  config.omniauth :g5, ENV['G5_AUTH_CLIENT_ID'], ENV['G5_AUTH_CLIENT_SECRET']
end
```

For more general information about setting up and using OmniAuth, see the
[official OmniAuth documentation][omniauth-wiki].

 [devise]: https://github.com/plataformatec/devise
 [omniauth-wiki]: https://github.com/intridea/omniauth/wiki

### Auth Hash

After authenticating, OmniAuth returns a hash of information in the Rack
environment under the key `omniauth.auth`. The G5 OmniAuth strategy
specifically uses the following subset of the full
[auth hash schema](https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema):

* `provider` - this will always be set to the symbol `:g5`
* `uid` - the unique identifier for the authenticated user
* `info` - a hash containing information about the user
  * `email` - the email address of the authenticated user
* `credentials` - information about the user's access token
  * `token` - the access token string
  * `expires` - boolean indicating whether the access token has an expiry date
    (always set to true for G5)
  * `expires_at` - timestamp of the expiry time
* `extra` - extra information returned from the auth server, including the raw
  user data and custom fields specific to G5
  * `raw_info` - a hash representation of the full JSON response from the G5
    auth server

For example:

```ruby
{"provider"=>:g5,
 "uid"=>42,
 "info"=>{"email"=>"test.user@test.host"},
 "credentials"=>
  {"token"=>"abc123",
   "expires_at"=>1430170866,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"id"=>42,
     "email"=>"test.user@test.host",
     "first_name"=>"Test",
     "last_name"=>"User",
     "phone_number"=>"(555) 555-5555",
     "organization_name"=>"Test Org",
     "title"=>"Tester",
     "roles"=>[{"id"=>4, "name"=>"viewer"}]}}}
```

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
[file an issue](https://github.com/G5/omniauth-g5/issues).

### Specs

Just execute:

```console
$ bundle exec rspec spec
```

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
