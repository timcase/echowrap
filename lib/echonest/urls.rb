require 'echonest/identity'

module Echonest
  class Urls < Echonest::Identity
    attr_reader :amazon_url, :itunes_url, :lastfm_url, :mb_url, :myspace_url, 
                :official_url, :wikipedia_url
    
    def id
      self.official_url
    end
  end
end
