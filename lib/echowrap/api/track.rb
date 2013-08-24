require 'echowrap/api/utils'

module Echowrap
  module API
    module Track
      include Echowrap::API::Utils

      # Get info about tracks given an id or md5. The md5 parameter is the file md5.
      #
      # @see http://developer.echonest.com/docs/v4/track.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Track] The track.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the track.  Required if md5 is not provided.  Example: 'TRTLKZV12E5AC92E11'.
      # @option options [String] :md5 The MD5 of the track. Required if ID is not provided.  Example: '881f4e47e88e8b570e34a3b49c8262ac'.
      # @option options [String] :bucket The type of track data that should be returned. Example: audio_summary.
      # @example Profile via id
      #   Echowrap.track_profile(:id => "TRTLKZV12E5AC92E11")
      def track_profile(options={})
        options.merge(:bucket => 'audio_summary') if options[:bucket].nil?
        object_from_response(Echowrap::Track, :get, '/api/v4/track/profile', :track, options)
      end

      # Upload a track to The Echo Nest's analyzer for analysis. The track will be analyzed. This method takes either a url parameter, or a local audio file, which should be the contents of the request body.
      #
      # @see http://developer.echonest.com/docs/v4/track.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Track] The track.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :url A url to an audio file. Cannot be combined with uploading local audio file.  Example: http://example.com/audio.mp3.
      # @option options [File] :track The track data. Cannot be
      # combined with url option
      # @option options [String] :filetype The type of audio file to be analyzed. Optional if uploading a local file, will be determined from file if not explicitly passed. Must be one of ['wav', 'mp3', 'au', 'ogg', 'm4a', 'mp4'].
      # @example Upload
      #   Echowrap.track_upload(:url => "http://example.com/audio.mp3")
      #   Echowrap.track_upload(:track => File.new('audio.mp3'))
      def track_upload(options={})
        options.merge(filetype: File.extname(options[:track]).gsub('.', '')) if options[:track] && options[:filetype].nil?
        object_from_response(Echowrap::Track, :post, '/api/v4/track/upload', :track, options)
      end

      # Get analysis info on tracks given an analysis_url. This method is not explicitly described by the Echowrap API and is provided as a helper.
      #
      # @see http://developer.echonest.com/docs/v4/track.html
      # @authentication Requires analysis url
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied analysis url is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied analysis url is expired.
      # @return [Echowrap::Track] The track.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :url The analysis url.  Required.  Example: 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367708437&Signature=pPUyoKFvgwXj2FORgohKOA6pRPc%3D'.
      # @example Analysis
      #   Echowrap.track_analysis(:url => "http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367708437&Signature=pPUyoKFvgwXj2FORgohKOA6pRPc%3D")
      def track_analysis(options={})
        url = options.delete(:url)
        response = send(:get, url, options)
        Echowrap::Analysis.new(response[:body])
      end

    end
  end
end
