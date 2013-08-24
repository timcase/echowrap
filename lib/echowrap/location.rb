require 'echonest/base'

module Echowrap
  class Location < Echowrap::Base
    attr_reader :city, :country, :location, :region

  end
end
