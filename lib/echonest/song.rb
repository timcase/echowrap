require 'echonest/identity'

module Echonest
    class Song < Echonest::Identity
      attr_reader :attributes, :artist_id, :artist_name, :title
    end
end