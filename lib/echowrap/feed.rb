require 'echowrap/base'

module Echowrap
  class Feed < Echowrap::Base
    attr_reader :name, :url, :date_posted, :date_found, :id, :summary, :type
    
    # @return [Array]
    def references
      @references ||= map_collection(Echowrap::Reference, :references)
    end
  end
end


