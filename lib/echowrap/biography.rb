require 'echowrap/base'

module Echowrap
  class Biography < Echowrap::Base
    attr_reader :site, :text, :url

    # @return [Echowrap::License]
    def license
      @license ||= Echowrap::License.new(@attrs[:license])
    end
  end
end

