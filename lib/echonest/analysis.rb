require 'echonest/base'

module Echonest
  class Analysis < Echonest::Base

    def bars
     @bars ||= map_collection(Echonest::Bar, :bars)
    end

    def beats
      @beats ||= map_collection(Echonest::Beat, :beats)
    end

    def id
      @attrs[:meta][:timestamp]
    end

    def meta
      @meta ||= Echonest::Meta.new(@attrs[:meta])
    end

    def sections
      @sections ||= map_collection(Echonest::Section, :sections)
    end

    def segments
      @segments ||= map_collection(Echonest::Segment, :segments)
    end

    def tatums
      @tatums ||= map_collection(Echonest::Tatum, :tatums)
    end

    def track
      @track ||= Echonest::Track.new(@attrs[:track])
    end

  end
end
