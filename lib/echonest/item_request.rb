require 'echonest/base'

module Echonest
  class ItemRequest < Echonest::Base
    attr_reader :artist_name, :item_id, :song_name
    
  end
end
