require 'echonest/identity'

module Echonest
    class TasteProfile < Echonest::Identity
      attr_reader :name, :type
    end
end
