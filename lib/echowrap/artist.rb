require 'echowrap/base'

module Echowrap
  class Artist < Echowrap::Base
    attr_reader :name, :twitter, :id, :familiarity, :hotttnesss

    # @return [Array]
    def biographies
      @biographies ||= map_collection(Echowrap::Biography, :biographies)
    end

    # @return [Array]
    def blogs
      @blogs ||= map_collection(Echowrap::Blog, :blogs)
    end

    # @return [Echowrap::DocCounts]
    def doc_counts
      @doc_counts ||= Echowrap::DocCounts.new(@attrs[:doc_counts])
    end

    # @return [Array]
    def images
      @images ||= map_collection(Echowrap::Image, :images)
    end

    # @return [Array]
    def foreign_ids
      @foreign_ids ||= map_collection(Echowrap::ForeignId, :foreign_ids)
    end

    # @return [Echowrap::Location]
    def location
      @location ||= Echowrap::Location.new(@attrs[:artist_location])
    end

    # @return [Array]
    def news
      @news ||= map_collection(Echowrap::NewsArticle, :news)
    end

    # @return [Array]
    def reviews
      @reviews ||= map_collection(Echowrap::Review, :reviews)
    end

    # @return [Array]
    def songs
      @songs ||= map_collection(Echowrap::Song, :songs)
    end

    # @return [Array]
    def terms
      @terms ||= map_collection(Echowrap::Term, :terms)
    end

    # @return [Echowrap::Urls]
    def urls
      @urls ||= Echowrap::Urls.new(@attrs[:urls])
    end

    # @return [Array]
    def video
      @video ||= map_collection(Echowrap::Video, :video)
    end

    # @return [Array]
    def years_active
      @years_active ||= map_collection(Echowrap::YearsActive, :years_active)
    end

  end
end
