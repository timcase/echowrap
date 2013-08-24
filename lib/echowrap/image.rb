require 'echowrap/base'

module Echowrap
  class Image < Echowrap::Base
    attr_reader :url

    # @return [Echowrap::License]
    def license
      @license ||= Echowrap::License.new(@attrs[:license])
    end

  end
end

  