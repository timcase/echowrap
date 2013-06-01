require 'echonest/base'

module Echonest
    class SequencedData < Echonest::Base
      attr_reader :start, :duration, :confidence

      def id
        "#{self.class.to_s.downcase}_#{self.start}"
      end

    end
end
