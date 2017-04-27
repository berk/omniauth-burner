# OmniAuth for Burner
[![Build Status](https://travis-ci.org/berk/omniauth-burner.png?branch=master)](https://travis-ci.org/berk/omniauth-burner)
[![Coverage Status](https://coveralls.io/repos/berk/omniauth-burner/badge.png?branch=master)](https://coveralls.io/r/berk/omniauth-burner?branch=master)
[![Gem Version](https://badge.fury.io/rb/omniauth-burner.svg)](http://badge.fury.io/rb/omniauth-burner)

Burner OAuth2 Strategy for OmniAuth 1.0.

Supports the OAuth 2.0 server-side. Read the Burner docs for more details: 

http://developer.burnerapp.com/api-documentation/authentication/

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-burner'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Burner` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :burner, ENV['BURNER_CLIENT_ID'], ENV['BURNER_SECRET']
end
```

## Configuring

You can configure several options, which you pass in to the `provider` method via a `Hash`:

* `scope`: A space-separated list of scopes you want to request from the user. See the Burner docs for a full list of available permissions.

For example, to request `messages:connect` permission:
 
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :burner, ENV['BURNER_CLIENT_ID'], ENV['BURNER_SECRET'], :scope => 'messages:connect burners:read'
end
```

## Authentication Hash

Here's an example *Authentication Hash* available in `request.env['omniauth.auth']`:

```ruby

{"provider"=>"burner",
 "uid"=>nil,
 "info"=>
   {"connected_burners"=>
   [{"id"=>"2342343423-234234-234234234-4234", "name"=>"My Burner"}]},
 "credentials"=>
  {"token"=>
    "dfkjadlfkjasdkjflaskdjfjsldflasjdflkasdjflaskdjf",
   "expires_at"=>1489053154,
   "expires"=>true},
 "extra"=>{}}
 
```

The precise information available may depend on the permissions which you request.
