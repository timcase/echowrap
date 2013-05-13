require 'echonest/identity'

module Echonest
    class ForeignId < Echonest::Identity
      attr_reader :catalog, :foreign_id

      def id
        self.foreign_id
      end
    end
end


