require 'echonest/base'

module Echonest
  class Urls < Echonest::Base
    attr_reader :amazon_url, :itunes_url, :lastfm_url, :mb_url, :myspace_url, 
                :official_url, :wikipedia_url
    
  end
end
