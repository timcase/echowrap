require 'echowrap/base'

module Echowrap
  class Asset < Echowrap::Base
    attr_reader :explicit, :filename, :id, :release, :title, :type, :year

    def echonest_ids
      @echonest_ids ||= map_collection(Echowrap::EchonestId, :echonest_ids)
    end

  end
end
