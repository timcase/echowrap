require 'echonest/identity'

module Echonest
    class TasteProfile < Echonest::Identity
      attr_reader :name, :pending_tickets, :resolved, :ticket, :total, :type 

      # @return [String]
      def id
        @attrs[:id] || @attrs[:ticket] || 'taste profile'
      end

      # @return [Echonest::Keyvalues]
      def keyvalues
        @keyvalues ||= Echonest::Keyvalues.new(@attrs[:keyvalues])
      end
    end
end
