require 'echonest/identity'

module Echonest
    class Location < Echonest::Identity
      attr_reader :city, :country, :location, :region
      
      def id
        self.location
      end
    end
end
