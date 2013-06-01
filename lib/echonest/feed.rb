require 'echonest/base'

module Echonest
  class Feed < Echonest::Base
    attr_reader :name, :url, :date_posted, :date_found, :id, :summary, :type
    
    # @return [Array]
    def references
      @references ||= map_collection(Echonest::Reference, :references)
    end
  end
end


