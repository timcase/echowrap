require 'echonest/identity'

module Echonest
    class Prediction < Echonest::Identity
      attr_reader :category, :results
      
      def id
        self.category
      end
    end
end
