require 'echowrap/base'

module Echowrap
    class TasteProfile < Echowrap::Base
      attr_reader :name, :pending_tickets, :resolved, :score, :ticket, :total, :type 

      # @return [String]
      def id
        @attrs[:id] || @attrs[:ticket]
      end
      
      # @return [Array]
      def items
        @items ||= map_collection(Echowrap::Item, :items)
      end

      # @return [Echowrap::Keyvalues]
      def keyvalues
        @keyvalues ||= Echowrap::Keyvalues.new(@attrs[:keyvalues])
      end
      
      # @return [Array]
      def predictions
        @predictions ||= map_collection(Echowrap::Prediction, :predictions)
      end
      
    end
end
