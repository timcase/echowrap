require 'echonest/api/utils'
require 'echonest/track'

module Echonest
  module API
    module Track
      include Echonest::API::Utils

      # Get info about tracks given an id or md5. The md5 parameter is the file md5.
      #
      # @see http://developer.echonest.com/docs/v4/track.html
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::Track] The track.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the track.  Required if md5 is not provided.  Example: 'TRTLKZV12E5AC92E11'.
      # @option options [String] :md5 The MD5 of the track. Required if ID is not provided.  Example: '881f4e47e88e8b570e34a3b49c8262ac'.
      # @option options [String] :bucket The type of track data that should be returned. Example: audio_summary.
      # @example Profile via id
      #   Echonest.track_profile(:url => "http://example.com/audio.mp3")
      def track_profile(options={})
        track_object_from_response(:get, "/api/v4/track/profile", options)
      end

      # Upload a track to The Echo Nest's analyzer for analysis. The track will be analyzed. This method takes either a url parameter, or a local audio file, which should be the contents of the request body.
      #
      # @see http://developer.echonest.com/docs/v4/track.html
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::Track] The track.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :url A url to an audio file. Cannot be combined with uploadig local audio file.  Example: http://example.com/audio.mp3.
      # @option options [String] :filetype The type of audio file to be analyzed. Required if uploading a local file. Must be one of ['wav', 'mp3', 'au', 'ogg', 'm4a', 'mp4'].
      # @option options [String] :track The track data.  Required if using 'multipart/form-data' Content-Type in header.  This is for web forms.
      # @example Upload via url
      #   Echonest.track_upload(:url => "http://example.com/audio.mp3")
      def track_upload(options={})
        track_object_from_response(:post, "/api/v4/track/upload", options)
      end


      private
      # @param request_method [Symbol]
      # @param path [String]
      # @param params [Hash]
      # @return [Echonest::Track]
      def track_object_from_response(request_method, path, options={})
        response = send(request_method.to_sym, path, options)
        Echonest::Track.fetch_or_new(response[:body][:response][:track])
      end

    end
  end
end
