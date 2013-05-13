require 'echonest/identity'

module Echonest
    class Artist < Echonest::Identity
      attr_reader :name, :twitter, :familiarity, :hotttnesss

      # @return [Array]
      def biographies
        @biographies ||= map_collection(Echonest::Biography, :biographies)
      end

      # @return [Array]
      def blogs
        @blogs ||= map_collection(Echonest::Blog, :blogs)
      end

      # @return [Array]
      def images
        @images ||= map_collection(Echonest::Image, :images)
      end

      # @return [Array]
      def foreign_ids
        @foreign_ids ||= map_collection(Echonest::ForeignId, :foreign_ids)
      end

      # @return [Array]
      def news
        @news ||= map_collection(Echonest::NewsArticle, :news)
      end

      # @return [Array]
      def reviews
        @reviews ||= map_collection(Echonest::Review, :reviews)
      end

      # @return [Array]
      def terms
        @terms ||= map_collection(Echonest::Term, :terms)
      end

      # @return [Echonest::Urls]
      def urls
        @urls ||= Echonest::Urls.new(@attrs[:urls])
      end

      # @return [Array]
      def video
        @video ||= map_collection(Echonest::Video, :video)
      end
    end
end
