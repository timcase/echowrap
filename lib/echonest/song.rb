require 'echonest/identity'

module Echonest
    class Song < Echonest::Identity
      attr_reader :artist_id, :artist_name, :attributes, :title
    end
end
