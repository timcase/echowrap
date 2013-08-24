require 'coveralls'
require 'echowrap'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def new_test_client
  client = Echowrap::Client.new(:api_key => "AK")
  #Param encoder is being set here because webmock expects params encodeded a certain way
  #Normally, you won't set this option, it's already configured for Echowrap in lib/echowrap/default.rb
  client.connection_options[:request][:params_encoder] = Faraday::NestedParamsEncoder
  client
end

def a_get(path, add_api_key = true)
  a_request(:get, Echowrap::Default::ENDPOINT + path + api_key(add_api_key))
end

def a_post(path)
  a_request(:post, Echowrap::Default::ENDPOINT + path)
end

def stub_get(path, add_api_key = true)
  stub_http_request(:get, Echowrap::Default::ENDPOINT + path + api_key(add_api_key))
end

def stub_post(path)
  stub_request(:post, Echowrap::Default::ENDPOINT + path)
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
