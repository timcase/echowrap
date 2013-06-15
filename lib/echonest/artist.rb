require 'echonest/base'

module Echonest
  class Artist < Echonest::Base
    attr_reader :name, :twitter, :id, :familiarity, :hotttnesss

    # @return [Array]
    def biographies
      @biographies ||= map_collection(Echonest::Biography, :biographies)
    end

    # @return [Array]
    def blogs
      @blogs ||= map_collection(Echonest::Blog, :blogs)
    end

    # @return [Echonest::DocCounts]
    def doc_counts
      @doc_counts ||= Echonest::DocCounts.new(@attrs[:doc_counts])
    end

    # @return [Array]
    def images
      @images ||= map_collection(Echonest::Image, :images)
    end

    # @return [Array]
    def foreign_ids
      @foreign_ids ||= map_collection(Echonest::ForeignId, :foreign_ids)
    end

    # @return [Echonest::Location]
    def location
      @location ||= Echonest::Location.new(@attrs[:artist_location])
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
    def songs
      @songs ||= map_collection(Echonest::Song, :songs)
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

    # @return [Array]
    def years_active
      @years_active ||= map_collection(Echonest::YearsActive, :years_active)
    end

  end
end
