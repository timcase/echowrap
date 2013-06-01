require 'echonest/base'

module Echonest
  class Asset < Echonest::Base
    attr_reader :explicit, :filename, :id, :release, :title, :type, :year

    def echonest_ids
      @echonest_ids ||= map_collection(Echonest::EchonestId, :echonest_ids)
    end

  end
end
