require 'coveralls'
require 'echonest'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path, add_api_key = true)
  a_request(:get, Echonest::Default::ENDPOINT + path + api_key(add_api_key))
end

def a_post(path)
  a_request(:post, Echonest::Default::ENDPOINT + path)
end

def stub_get(path, add_api_key = true)
  stub_http_request(:get, Echonest::Default::ENDPOINT + path + api_key(add_api_key))
end

def stub_post(path)
  stub_request(:post, Echonest::Default::ENDPOINT + path)
end


def api_key(add_api_key = true)
  add_api_key ? '?api_key=AK' : ''
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
