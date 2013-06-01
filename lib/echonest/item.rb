require 'echonest/base'

module Echonest
  class Item < Echonest::Base
    attr_reader :artist_familiarity, :artist_hotttnesss, :artist_id, :artist_name, 
                :date_added, :foreign_id, :last_modified, :play_count, :song_hotttnesss, 
                :song_id, :song_name, :song_type

    # @return [Echonest::ArtistLocation]
    def artist_location
      @artist_location ||= Echonest::Location.new(@attrs[:artist_location])
    end

    # @return [Echonest::AudioSummary]
    def audio_summary
      @audio_summary ||= Echonest::AudioSummary.new(@attrs[:audio_summary])
    end

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
    def foreign_ids
      @foreign_ids ||= map_collection(Echonest::ForeignId, :foreign_ids)
    end

    # @return [Array]
    def images
      @images ||= map_collection(Echonest::Image, :images)
    end

    # @return [Echonest::Location]
    def location
      @location ||= Echonest::Location.new(@attrs[:artist_location])
    end

    # @return [Array]
    def news
      @news ||= map_collection(Echonest::NewsArticle, :news)
    end
    
    # @return [Echonest::ItemRequest]
    def request
      @request ||= Echonest::ItemRequest.new(@attrs[:request])
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

    # @return [Array]
    def tracks
      @tracks ||= map_collection(Echonest::Track, :tracks)
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
