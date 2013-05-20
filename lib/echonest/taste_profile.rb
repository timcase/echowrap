require 'echonest/identity'

module Echonest
    class TasteProfile < Echonest::Identity
      attr_reader :name, :pending_tickets, :resolved, :score, :ticket, :total, :type 

      # @return [String]
      def id
        @attrs[:id] || @attrs[:ticket] || 'taste profile'
      end
      
      # @return [Array]
      def items
        @items ||= map_collection(Echonest::Item, :items)
      end

      # @return [Echonest::Keyvalues]
      def keyvalues
        @keyvalues ||= Echonest::Keyvalues.new(@attrs[:keyvalues])
      end
      
      # @return [Array]
      def predictions
        @predictions ||= map_collection(Echonest::Prediction, :predictions)
      end
      
    end
end
