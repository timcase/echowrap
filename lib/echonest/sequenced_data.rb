require 'echonest/identity'

module Echonest
    class SequencedData < Echonest::Identity
      attr_reader :start, :duration, :confidence

      def id
        "#{self.class.to_s.downcase}_#{self.start}"
      end

    end
end
