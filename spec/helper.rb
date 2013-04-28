require 'echonest'
require 'echonest/identity_map'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, Echonest::Default::ENDPOINT + path + api_key)
end

def stub_get(path)
  stub_request(:get, Echonest::Default::ENDPOINT + path + api_key)
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
