require 'echowrap/api/utils'

module Echowrap
  module API
    module Song
      include Echowrap::API::Utils

      # Identifies a song given an Echoprint or Echo Nest Musical Fingerprint hash codes.
      #
      # @see http://developer.echonest.com/docs/v4/song.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Track] The identified song.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :query The JSON query.  Use only with POST.  Example: See "Here is a sample query:" at http://developer.echonest.com/docs/v4/song.html#identify.
      # @option options [String] :code The FP hashcodes for the track.  Use only with GET. Example: See "Identifying Songs with GET at http://developer.echonest.com/docs/v4/song.html#identify."
      # @option options [String] :artist The name of the artist from the ID3 tag.  Use only with GET, not required. Example: 'Michael+Jackson'
      # @option options [String] :title The title of the track from the ID3 tag. Use only with GET, not required. Example: 'Billie+Jean'
      # @option options [String] :release The title of the track from the ID3 tag. Use only with GET, not required. Example: 'Thriller'
      # @option options [String] :duration The length of time of the track, in seconds. Use only with GET, not required. Example: '296.15'
      # @option options [String] :genre The genre from the ID3 tag. Use only with GET, not required. Example: 'pop'
      # @option options [String] :version Version of codegen used to generate the code.  Not required.  Example: For ENMFP use 3.15, for Echoprint use 4.12, defaults to 3.15
      # @option options [String] :bucket The type of track data that should be returned. Must be one of ['audio_summary', 'artist_familiarity', 'artist_hotttnesss', 'artist_location', 'song_hotttnesss', 'song_type', 'tracks', 'id:Rosetta-space']. Example: audio_summary.
      # @example Identify via json query file
      #   Echowrap.song_identify(:query => File.new('query.json'))
      def song_identify(options={})
        if options.key?(:query)
          objects_from_response(Echowrap::Song, :post, '/api/v4/song/identify', :songs, options).first
        else
          objects_from_response(Echowrap::Song, :get, '/api/v4/song/identify', :songs, options).first
        end
      end


      # Get info about songs given a song id or track id.
      #
      # @see http://developer.echonest.com/docs/v4/song.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Song] The song.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the song.  Required if track_id is not provided.  Example: 'SOCZMFK12AC468668F'.
      # @option options [String] :track_id The ID of the track. Required if id is not provided.  Example: 'TRTLKZV12E5AC92E11'.
      # @option options [String] :bucket The type of track data that should be returned. Must be one of ['audio_summary', 'artist_familiarity', 'artist_hotttnesss', 'artist_location', 'song_hotttnesss', 'song_type', 'tracks', 'id:Rosetta-space']. Example: audio_summary.
      # @example Profile via id
      #   Echowrap.song_profile(:id => 'SOCZMFK12AC468668F')
      def song_profile(options={})
        objects_from_response(Echowrap::Song, :get, '/api/v4/song/profile', :songs, options).first
      end

      # Search for songs given different query types
      #
      # @see http://developer.echonest.com/docs/v4/song.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Array] Array of songs.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :title The title of the song.
      # @option options [String] :artist The artist of the song.
      # @option options [String] :combined Query both artist and title fields.
      # @option options [String] :description A description of the artist, some examples are: 'alt-rock','-emo', 'harp^2'. Warning Description cannot be used in conjunction with title, artist, combined, or artist_id.
      # @option options [String] :style A musical style or genre like rock, jazz, or funky, some examples are: 'jazz', 'metal^2'.
      # @option options [String] :mood A mood like happy or sad, some examples are: 'happy', 'sad^.5'.
      # @option options [String] :rank_type For search by description, style or mood indicates whether results should be ranked by query relevance or by artist familiarity, must be one of ['relevance', 'familiarity'], with 'relevance' as default
      # @option options [String] :artist_id The artist ID. An Echo Nest ID or a Rosetta ID.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :song_type Controls the type of songs returned. Supported song_types are: 'christmas', 'live' and 'studio'. A song type can optionally be followed by ':' and a state, where the state can be one of 'true', 'false' or 'any'. If no state is given, the desired state is assumed to be 'true'.
      # @option options [Float] :max_tempo The maximum tempo for the song, the valid range for max_tempo is 0.0 to 500.0 (BPM), with 500.0 as default.
      # @option options [Float] :min_tempo The minimum tempo for the song, the valid range for min_tempo is 0.0 to 500.0 (BPM), with 0.0 as default.
      # @option options [Float] :max_duration The maximum duration of any song, the valid range for max_duration is 0.0 to 3600.0 (seconds), with 3600.0 as default.
      # @option options [Float] :min_duration The minimum duration of any song, the valid range for min_duration is 0.0 to 3600.0 (seconds), with 0.0 as default.
      # @option options [Float] :max_loudness The maximum loudness of any song, the valid range for max_loudness is -100.0 to 100.0 (decibels), with 100.0 as default.
      # @option options [Float] :min_loudness The minimum loudness of any song, the valid range for min_loudness is 0.0 to -100.0 (decibels), with -100.0 as default.
      # @option options [Float] :artist_max_familiarity The maximum familiarity of any song, the valid range for artist_max_familiarity is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :artist_min_familiarity The minimum familiarity of any song, the valid range for artist_min_familiarity is 0.0 to 1.0, with 0.0 as default.
      # @option options [String] :artist_start_year_before Matches artists that have an earliest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_start_year_after Matches artists that have an earliest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_before Matches artists that have an latest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_after Matches artists that have an latest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [Float] :song_max_hotttnesss The maximum hotttnesss of any song, the valid range for song_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :song_min_hotttnesss The minimum hotttnesss of any song, the valid range for the song_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :artist_max_hotttnesss The maximum hotttnesss of any song's artist, the valid range for artist_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :artist_min_hotttnesss The minimum hotttnesss of any song's artist, the valid range for the artist_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_longitude The maximum longitude of the primary artist location, the valid range for max_longitude is -180.0 to 180.0, with 180.0 as default.
      # @option options [Float] :min_longitude The minimum longitude of the primary artist location, the valid range for min_longitude is -180.0 to 180.0, with -180.0 as default.
      # @option options [Float] :max_latitude The maximum latitude of the primary artist location, the valid range for max_latitude is -90.0 to 90.0, with 90.0 as default.
      # @option options [Float] :min_latitude The minimum longitude of the primary artist location, the valid range for max_latitude is -90.0 to 90.0, with -90.0 as default.
      # @option options [Float] :max_danceability The maximum danceability of any song, the valid range for max_danceability is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_danceability The minimum danceability of any song, the valid range for min_danceability is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_energy The maximum energy of any song, the valid range for max_energy is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_energy The minimum energy of any song, the valid range for min_energy is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_liveness The maximum liveness of any song, the valid range for max_liveness is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_liveness The minimum liveness of any song, the valid range for min_liveness is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_speechiness The maximum speechiness of any song, the valid range for max_speechiness is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_speechiness The minimum speechiness of any song, the valid range for min_speechiness is 0.0 to 1.0, with 0.0 as default.
      # @option options [Integer] :key The key of songs in the playlist, the valid range for key is 0 to 11 (C, C-sharp, D, D-sharp, E... with 0 representing C and 11 representing B).
      # @option options [Integer] :mode The mode of songs, must be one of [0, 1] (minor, major), with 0 representing minor and 1 represeting major.
      # @option options [String] :bucket Indicates what data should be returned for each song. If specifying the "tracks" bucket, a bucket with an id space must also be specified. Must be one of ['audio_summary', 'artist_familiarity', 'artist_hotttnesss', 'artist_location', 'song_hotttnesss', 'song_type', 'tracks', 'id:Rosetta-space'].
      # @option options [String] :sort Indicates how the songs results should be ordered. Must be one of ['tempo-asc', 'duration-asc', 'loudness-asc', 'speechiness-asc', 'liveness-asc', 'artist_familiarity-asc', 'artist_hotttnesss-asc', 'artist_start_year-asc', 'artist_start_year-desc', 'artist_end_year-asc', 'artist_end_year-desc', 'song_hotttness-asc', 'latitude-asc', 'longitude-asc', 'mode-asc', 'key-asc', 'tempo-desc', 'duration-desc', 'loudness-desc', 'liveness-desc', 'speechiness-desc', 'artist_familiarity-desc', 'artist_hotttnesss-desc', 'song_hotttnesss-desc', 'latitude-desc', 'longitude-desc', 'mode-desc', 'key-desc', 'energy-asc', 'energy-desc', 'danceability-asc', 'danceability-desc'].
      # @option options [String] :limit If 'true', limit the results to any of the given idspaces or catalogs. Must be on of ['true', 'false'] with 'false' as the default.
      # @return [Array<Echowrap::Song>]
      # @example Return an array of songs with artist 'Daft Punk'
      #   Echowrap.song_search(:artist => "Daft Punk")
      def song_search(options={})
        objects_from_response(Echowrap::Song, :get, '/api/v4/song/search', :songs, options)
      end

    end
  end
end
