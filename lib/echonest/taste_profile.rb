require 'echonest/identity'

module Echonest
    class TasteProfile < Echonest::Identity
      attr_reader :name, :ticket, :type
      
      def id
        @attrs[:id] || self.ticket
      end
    end
end
