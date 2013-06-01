require 'echonest/base'

module Echonest
    class Term < Echonest::Base
      attr_reader :name, :frequency, :weight

    end
end
