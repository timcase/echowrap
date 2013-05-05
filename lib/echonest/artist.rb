require 'echonest/identity'

module Echonest
    class Artist < Echonest::Identity
      attr_reader :name
    end
end
