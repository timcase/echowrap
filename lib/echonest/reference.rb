require 'echonest/base'

module Echonest
    class Reference < Echonest::Base
      attr_reader :artist_id, :artist_name
    end
end

