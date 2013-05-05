require 'echonest/identity'

module Echonest
    class Analysis < Echonest::Identity


    def bars
     @bars ||= map_sequenced_data(Echonest::Bar, :bars)
    end

    def beats
      @beats ||= map_sequenced_data(Echonest::Beat, :beats)
    end

    def id
      @attrs[:meta][:timestamp]
    end

    def meta
      @meta ||= Echonest::Meta.new(@attrs[:meta])
    end

    def sections
      @sections ||= map_sequenced_data(Echonest::Section, :sections)
    end

    def segments
      @segments ||= map_sequenced_data(Echonest::Segment, :segments)
    end

    def tatums
      @tatums ||= map_sequenced_data(Echonest::Tatum, :tatums)
    end

    def track
      @track ||= Echonest::Track.new(@attrs[:track])
    end


    private

    # @param klass [Class]
    # @param key [Symbol]
    def map_sequenced_data(klass, key)
      Array(@attrs[key.to_sym]).map do |entity|
        klass.fetch_or_new(entity)
      end
    end

  end
end
