# The Echonest Ruby Gem
[![Echonest](http://echonest.com/static/img/logos/250x200_dk.gif)](http://developer.echonest.com/index.html)

A Ruby interface to the Echonest API

## Installation

Add this line to your application's Gemfile:

    gem 'echonest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install echonest

## Quick Start Guide

First, [get an api key from Echonest][register].

Then copy and paste in your API keys:

```ruby
Echonest.configure do |config|
  config.api_key = 'YOUR_API_KEY'
  #consumer key and shared secret are not implemented yet
end 
```
You are ready to use Echonest:

```ruby
Echonest.song_search(artist: 'Daft Punk')
```

[register]: http://developer.echonest.com/account/register

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
