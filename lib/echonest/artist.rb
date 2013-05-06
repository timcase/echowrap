require 'echonest/identity'

module Echonest
    class Artist < Echonest::Identity
      attr_reader :name

      def biographies
        @biographies ||= map_collection(Echonest::Biography, :biographies)
      end

      def blogs
        @blogs ||= map_collection(Echonest::Blog, :blogs)
      end

      def images
        @images ||= map_collection(Echonest::Image, :images)
      end
    end
end
