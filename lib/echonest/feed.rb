require 'echonest/identity'

module Echonest
  class Feed < Echonest::Identity
    attr_reader :name, :url, :date_posted, :date_found, :summary, :type
    
    # @return [Array]
    def references
      @references ||= map_collection(Echonest::Reference, :references)
    end
  end
end


