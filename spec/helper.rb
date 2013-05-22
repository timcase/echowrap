require 'coveralls'
require 'echonest'
require 'echonest/identity_map'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, Echonest::Default::ENDPOINT + path + api_key)
end

def a_post(path)
  a_request(:post, Echonest::Default::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Echonest::Default::ENDPOINT + path + api_key)
end

def stub_post(path)
  stub_request(:post, Echonest::Default::ENDPOINT + path)
end


def api_key
  '?api_key=AK'
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
