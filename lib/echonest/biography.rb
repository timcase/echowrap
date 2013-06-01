require 'echonest/base'

module Echonest
  class Biography < Echonest::Base
    attr_reader :site, :text, :url

    # @return [Echonest::License]
    def license
      @license ||= Echonest::License.new(@attrs[:license])
    end
  end
end

