# The Echowrap Ruby Gem
[![Echonest](http://echonest.com/static/img/logos/250x200_dk.gif)](http://developer.echonest.com/index.html)

A Ruby interface to the Echonest API. The Echonest API is based on their
automatically derived-database of about 30 million songs which
is aggregated using web crawling, data mining, and digital signal
processing techniques. The API includes support for music
recommendation, artist recommendation,  playlist generation, acoustic
analysis, music identification, and data feeds. Details about the API
can be found at http://developer.echonest.com/

* This wrapper supports 100% of the [Echonest API Version 4](http://developer.echonest.com/docs/v4)
* Data returned from API calls are mapped into Ruby objects
* Various http clients are supported via [Faraday](https://github.com/lostisland/faraday)
* Uses Unix philosophy of "do one thing and do it well"

[![Dependency Status](https://gemnasium.com/timcase/echowrap.png)](https://gemnasium.com/timcase/echowrap)
[![Build
Status](https://travis-ci.org/timcase/echowrap.png)](https://travis-ci.org/timcase/echowrap)
[![Code Climate](https://codeclimate.com/github/timcase/echonest.png)](https://codeclimate.com/github/timcase/echonest)
[![Coverage Status](https://coveralls.io/repos/timcase/echonest/badge.png?branch=master)](https://coveralls.io/r/timcase/echonest?branch=master)

## Supported Rubies
This library is [tested against](https://travis-ci.org/timcase/echonest) the following Ruby implentations 
* Ruby 1.9.2
* Ruby 1.9.3 
* Ruby 2.0
* JRuby 1.9 mode

## Gem Dependencies
Installing this gem also installs the following gems:

* [faraday](https://github.com/lostisland/faraday) HTTP client lib that provides a common interface over many adapters (such as Net::HTTP) and embraces the concept of Rack middleware when processing the request/response cycle.
* [multi_json](https://github.com/intridea/multi_json) A common interface to multiple JSON libraries, including Oj, Yajl, the JSON gem (with C-extensions), the pure-Ruby JSON gem, NSJSONSerialization, gson.rb, JrJackson, and OkJson. 
* [simple_oauth](https://github.com/laserlemon/simple_oauth) Builds and verifies OAuth headers

## Installation

Add this line to your application's Gemfile:
```ruby
    gem 'echowrap'
```
And then execute:
```shell
    $ bundle install
```
Or install it yourself as:
```shell
    $ gem install echowrap
```
## Quick Start Guide

First, [get an api key from Echonest][register].

Then copy and paste in your API keys:

```ruby
Echowrap.configure do |config|
  config.api_key =       'YOUR_API_KEY'
  config.consumer_key =  'YOUR_CONSUMER_KEY'
  config.shared_secret = 'YOUR_SHARED_SECRET'
end
```
If you are using Echowrap with a Rails application then a good location
for the key would be to create an initializer, for example you could
place the above code in /config/initializers/echowrap.rb.

You can also use Echowrap in any plain old ruby file and I've included
an example of this
[here](https://github.com/timcase/echowrap/blob/master/examples/echowrap_examples.rb)

You are ready to use Echowrap:

```ruby
Echowrap.song_search(artist: 'Daft Punk')
```

[register]: http://developer.echonest.com/account/register

## Usage
See [Usage page](https://github.com/timcase/echonest/wiki) for a complete listing of the api methods

## Tests
An Rspec test suite is available to ensure API functionality:

1. $ git clone git://github.com/timcase/echowrap.git
2. $ bundle install (installs rspec and other supporting gems, see
   [GEMFILE](https://github.com/timcase/echonest/blob/master/Gemfile)
   for complete listing)
3. $ rspec

## More Information
More information can be found on the [project website on
GitHub](https://github.com/timcase/echowrap). There is extensive usage
documentation available [on the
wiki](https://github.com/timcase/echowrap/wiki).

## API Documentation
Full API Documentation can be found in the
[wiki](https://github.com/timcase/echowrap/wiki)

## License
Echowrap is released under the [MIT
License](https://github.com/timcase/echowrap/blob/master/LICENSE.txt).

## Support
Bug reports and feature requests should be filed on the [github issue
tracking page](https://github.com/timcase/echowrap/issues). 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##Acknowledgement
Much of the heavy lifting was done by studying the [Twitter gem](https://github.com/sferik/twitter).

##Contributors
[Tim Case](timcase.me)
