require 'echonest/base'

module Echonest
  class Location < Echonest::Base
    attr_reader :city, :country, :location, :region

  end
end
