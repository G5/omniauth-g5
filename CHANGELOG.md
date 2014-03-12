# v0.1.0 (2014-03-12)

* Moved `rake g5:export_users` task to
  [devise_g5_authenticatable](https://github.com/G5/devise_g5_authenticatable)
* First open source release to [RubyGems](https://rubygems.org)

# v0.0.2 (2013-11-06)

* Changed `rake g5:export_users` task to read default argument values
  from environment variables:
  * `G5_AUTH_CLIENT_ID` - the G5 OAuth application ID
  * `G5_AUTH_CLIENT_SECRET` - the G5 OAuth application secret
  * `G5_AUTH_REDIRECT_URI` - the redirect URI registered with the auth server
  * `G5_AUTH_ENDPOINT` - the auth server endpoint URL
  * `G5_AUTH_AUTHORIZATION_CODE` - the G5 OAuth authorization code for
    obtaining an access token
* Changed argument order for `rake g5:export_users` such that
  `authorization_code` now comes first.
* Renamed any references to the client callback URL to redirect URI, to
  maintain terminology consistent with the OAuth 2.0 specification.

# v0.0.1 (2013-07-25)

* Initial release
