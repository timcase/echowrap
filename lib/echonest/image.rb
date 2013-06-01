require 'echonest/base'

module Echonest
  class Image < Echonest::Base
    attr_reader :url

    # @return [Echonest::License]
    def license
      @license ||= Echonest::License.new(@attrs[:license])
    end

  end
end

  