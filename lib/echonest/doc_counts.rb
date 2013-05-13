require 'echonest/identity'

module Echonest
    class DocCounts < Echonest::Identity
      attr_reader :audio, :biographies, :blogs, :images, :news, :reviews, :songs, :video
      
      def id
        self.songs
      end
    end
end
