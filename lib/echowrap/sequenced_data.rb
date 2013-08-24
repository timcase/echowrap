require 'echowrap/base'

module Echowrap
    class SequencedData < Echowrap::Base
      attr_reader :start, :duration, :confidence

      def id
        "#{self.class.to_s.downcase}_#{self.start}"
      end

    end
end
