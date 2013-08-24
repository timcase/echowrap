require 'echowrap/base'

module Echowrap
  class Analysis < Echowrap::Base

    def bars
     @bars ||= map_collection(Echowrap::Bar, :bars)
    end

    def beats
      @beats ||= map_collection(Echowrap::Beat, :beats)
    end

    def id
      @attrs[:meta][:timestamp]
    end

    def meta
      @meta ||= Echowrap::Meta.new(@attrs[:meta])
    end

    def sections
      @sections ||= map_collection(Echowrap::Section, :sections)
    end

    def segments
      @segments ||= map_collection(Echowrap::Segment, :segments)
    end

    def tatums
      @tatums ||= map_collection(Echowrap::Tatum, :tatums)
    end

    def track
      @track ||= Echowrap::Track.new(@attrs[:track])
    end

  end
end
