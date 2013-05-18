require 'echonest/api/utils'

module Echonest
  module API
    module Playlist
      include Echonest::API::Utils

      # Returns a basic playlist. A basic playlist is generated once from an initial set of parameters, and returned as an ordered list of songs. Basic playlist functionality is supported, see the static and dynamic playlist APIs for advanced contextual and personalized playlisting.
      # Some properties of a basic playlist:
      #   Songs are never repeated
      #   Artists may be repeated
      # A number of different algorithms can be used to select songs for the playlist. These are specified with the type parameter.
      # @see http://developer.echonest.com/docs/v4/playlist.html#basic
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Array] Array of songs.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type The type of the playlist to be generated. Not required, must be one of ['artist-radio', 'song-radio', 'genre-radio']
      # @option options [String] :artist_id ID(s) of seed artist(s) for the playlist. Echo Nest or Rosetta IDs.  Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'ARH6W4X1187B99274F' or '7digital-US:artist:304'.
      # @option options [String] :artist Name(s) of seed artist(s) for the playlist. Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'Weezer, the+beatles'.
      # @option options [String] :song_id ID(s) of seed song(s) for the playlist. Echo Nest or Rosetta IDs.  Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'SOCZMFK12AC468668F'.
      # @option options [String] :genre A musical genre such as rock, jazz, or dance pop. See the artist method list_genres for details on what genres are currently available, only allowed for genre-radio playlist types and required for genre-radio playlist types. Example: 'jazz, metal'.
      # @option options [String] :track_id ID(s) of seed track(s) for the playlist. Echo Nest or Rosetta IDs.  Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'TRTLKZV12E5AC92E11'.
      # @option options [Integer] :results The desired number of songs in the playlist, the valid range is 0 to 100, with 15 as the default
      # @option options [String] :bucket Specifies which extra information should be returned in the playlist. Not require, may use multiple, must be one of ['id:catalog-name', 'tracks'].  When specifying idspace buckets (those starting with "id:") the results will be returned in a "foreign_ids" key/element. See Project Rosetta Stone for more information on ID spaces. Example: "tracks".
      # @option options [String] :limit If 'true', limit the results to any of the given rosetta id space. Must be on of ['true', 'false'] with 'false' as the default. If limit is set to anything but false, at least one idspace must also be provided in the bucket parameter.
      # @option options [String] :dmca If true or 'styleb' the playlist delivered will meet the DMCA rules. When the DMCA parameter is set to true, the playlist will conform to the following rules: No more than 2 songs in a row from the same album, no more than 3 songs from an album in a 3 hour period, no more than 3 different songs in a row by the same artist, no more than 4 songs by the same artist in a 3 hour period.  Skipped songs are not considered to have been played for DMCA conformance purposes. If dmca is set to 'styleb', skipped songs are considered to have been played for DMCA purposes.
      # @return [Array<Echonest::Song>]
      # @example Return an array of songs with artist 'Daft Punk'
      #   Echonest.playlist_basic(:artist => "Daft Punk")
      def playlist_basic(options={})
        objects_from_response(Echonest::Song, :get, '/api/v4/playlist/basic', :songs, options)
      end

      # Returns a static playlist. A static playlist is generated once from an initial set of parameters, and returned as an ordered list of songs.
      # Some properties of a static playlist:
      #   Songs are never repeated
      #   Artist may be repeated
      # A number of different algorithms can be used to select songs for the playlist. These are specified with the type parameter.
      # @see http://developer.echonest.com/docs/v4/playlist.html#static
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Array] Array of songs.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type The type of the playlist to be generated. Not required, must be one of ['artist', 'artist-radio', 'artist-description', 'song-radio', 'catalog', 'catalog-radio', 'genre-radio'], 'artist' is default.
      # @option options [String] :artist_pick The artist_pick parameter is used to determine how songs are picked for each artist in artist-type playlists. If the asc or desc suffix is ommitted, artist_pick defaults to descending. Not required, must one of ['song_hotttnesss-desc', 'tempo', 'duration', 'loudness', 'mode', 'key']
      # @option options [Float] :variety The maximum variety of artists to be represented in the playlist. A higher number will allow for more variety in the artists. Must be between 0.0 and 1.0, default is 0.5.  Example: 0.7.
      # @option options [String] :distribution Controls the distribution of artists in the playlist. A focused distribution yields a playlist of songs that are tightly clustered around the seeds, whereas a wandering distribution yields a playlist from a broader range of artists. Not required, must be on of ['focused', 'wandering'], 'focused' is default.
      # @option options [Float] :adventurousness Controls the trade between known music and unknown music. A value of 0 means no adventurousness, only known and preferred music will be played. A value of 1 means high adventurousness, mostly unknown music will be played. A value of auto indicates that the adventurousness should be automatically determined based upon the taste profile of the user. This parameter only applies to catalog and catalog-radio type playlists. Not required must greater than 0.0 and less than 1.0, default is 0.2.
      # @option options [String] :artist_id ID(s) of seed artist(s) for the playlist. Echo Nest or Rosetta IDs.  Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'ARH6W4X1187B99274F' or '7digital-US:artist:304'.
      # @option options [String] :artist Name(s) of seed artist(s) for the playlist. Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'Weezer, the+beatles'.
      # @option options [String] :seed_catalog ID of seed catalog for playlist. Not required.  Example: 'CAKSMUX1321A708AA4'.
      # @option options [String] :song_id ID(s) of seed song(s) for the playlist. Echo Nest or Rosetta IDs.  Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'SOCZMFK12AC468668F'.
      # @option options [String] :track_id ID(s) of seed track(s) for the playlist. Echo Nest or Rosetta IDs.  Not required, may use multiple, no more than 5 total artist_id, artist, track_id, and song_id parameters.  Example: 'TRTLKZV12E5AC92E11'.
      # @option options [String] :description Description of the type of songs that can be included in the playlist. Not required, may use multiple.  Example: 'alt-rock,-emo,harp^2'.
      # @option options [String] :genre A musical genre such as rock, jazz, or dance pop. See the artist method list_genres for details on what genres are currently available, only allowed for genre-radio playlist types and required for genre-radio playlist types. Example: 'jazz, metal'.
      # @option options [String] :style A musical style or genre like rock, jazz, or funky, some examples are: 'jazz', 'metal^2'.
      # @option options [String] :mood A mood like happy or sad, some examples are: 'happy', 'sad^.5'.
      # @option options [Integer] :results The desired number of songs in the playlist, the valid range is 0 to 100, with 15 as the default
      # @option options [Float] :max_tempo The maximum tempo for any song on the playlist, the valid range for max_tempo is 0.0 to 500.0 (BPM), with 500.0 as default.
      # @option options [Float] :min_tempo The minimum tempo for any song on the playlist, the valid range for min_tempo is 0.0 to 500.0 (BPM), with 0.0 as default.
      # @option options [Float] :max_duration The maximum duration of any song on the playlist, the valid range for max_duration is 0.0 to 3600.0 (seconds), with 3600.0 as default.
      # @option options [Float] :min_duration The minimum duration of any song on the playlist, the valid range for min_duration is 0.0 to 3600.0 (seconds), with 0.0 as default.
      # @option options [Float] :max_loudness The maximum loudness of any song on the playlist, the valid range for max_loudness is -100.0 to 100.0 (decibels), with 100.0 as default.
      # @option options [Float] :min_loudness The minimum loudness of any song on the playlist, the valid range for min_loudness is 0.0 to -100.0 (decibels), with -100.0 as default.
      # @option options [Float] :max_danceability The maximum danceability of any song, the valid range for max_danceability is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_danceability The minimum danceability of any song, the valid range for min_danceability is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_energy The maximum energy of any song, the valid range for max_energy is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_energy The minimum energy of any song, the valid range for min_energy is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_liveness The maximum liveness of any song, the valid range for max_liveness is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_liveness The minimum liveness of any song, the valid range for min_liveness is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_speechiness The maximum speechiness of any song, the valid range for max_speechiness is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_speechiness The minimum speechiness of any song, the valid range for min_speechiness is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :artist_max_familiarity The maximum artist familiarity of any song on the playlist, the valid range for artist_max_familiarity is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :artist_min_familiarity The minimum artist familiarity of any song on the playlist, the valid range for artist_min_familiarity is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :artist_max_hotttnesss The maximum artist hotttnesss of any song on the playlist, the valid range for artist_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :artist_min_hotttnesss The minimum artist hotttnesss of any song on the playlist, the valid range for the artist_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [String] :song_type Controls the type of songs returned. Supported song_types are: 'christmas', 'live' and 'studio'. A song type can optionally be followed by ':' and a state, where the state can be one of 'true', 'false' or 'any'. If no state is given, the desired state is assumed to be 'true'.
      # @option options [String] :artist_start_year_before Matches artists that have an earliest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_start_year_after Matches artists that have an earliest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_before Matches artists that have an latest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_after Matches artists that have an latest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [Float] :song_max_hotttnesss The maximum hotttnesss of any song, the valid range for song_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :song_min_hotttnesss The minimum hotttnesss of any song, the valid range for the song_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [Float] :max_longitude The maximum longitude of the primary artist location, the valid range for max_longitude is -180.0 to 180.0, with 180.0 as default.
      # @option options [Float] :min_longitude The minimum longitude of the primary artist location, the valid range for min_longitude is -180.0 to 180.0, with -180.0 as default.
      # @option options [Float] :max_latitude The maximum latitude of the primary artist location, the valid range for max_latitude is -90.0 to 90.0, with 90.0 as default.
      # @option options [Float] :min_latitude The minimum longitude of the primary artist location, the valid range for max_latitude is -90.0 to 90.0, with -90.0 as default.
      # @option options [Integer] :mode The mode of songs, must be one of [0, 1] (minor, major), with 0 representing minor and 1 represeting major.
      # @option options [Integer] :key The key of songs in the playlist, the valid range for key is 0 to 11 (C, C-sharp, D, D-sharp, E... with 0 representing C and 11 representing B).
      # @option options [String] :bucket Indicates what data should be returned for each song. If specifying the "tracks" bucket, a bucket with an id space must also be specified. Must be one of ['audio_summary', 'artist_familiarity', 'artist_hotttnesss', 'artist_location', 'song_hotttnesss', 'song_type', 'tracks', 'id:Rosetta-space'].
      # @option options [String] :sort Indicates how the songs results should be ordered. Must be one of ['tempo-asc', 'duration-asc', 'loudness-asc', 'speechiness-asc', 'liveness-asc', 'artist_familiarity-asc', 'artist_hotttnesss-asc', 'artist_start_year-asc', 'artist_start_year-desc', 'artist_end_year-asc', 'artist_end_year-desc', 'song_hotttness-asc', 'latitude-asc', 'longitude-asc', 'mode-asc', 'key-asc', 'tempo-desc', 'duration-desc', 'loudness-desc', 'liveness-desc', 'speechiness-desc', 'artist_familiarity-desc', 'artist_hotttnesss-desc', 'song_hotttnesss-desc', 'latitude-desc', 'longitude-desc', 'mode-desc', 'key-desc', 'energy-asc', 'energy-desc', 'danceability-asc', 'danceability-desc'].
      # @option options [String] :limit If 'true', limit the results to any of the given rosetta id space. Must be on of ['true', 'false'] with 'false' as the default. If limit is set to anything but false, at least one idspace must also be provided in the bucket parameter.
      # @option options [String] :dmca If true or 'styleb' the playlist delivered will meet the DMCA rules. When the DMCA parameter is set to true, the playlist will conform to the following rules: No more than 2 songs in a row from the same album, no more than 3 songs from an album in a 3 hour period, no more than 3 different songs in a row by the same artist, no more than 4 songs by the same artist in a 3 hour period.  Skipped songs are not considered to have been played for DMCA conformance purposes. If dmca is set to 'styleb', skipped songs are considered to have been played for DMCA purposes.
      # @return [Array<Echonest::Song>
      # @example Return an array of songs with artist 'Daft Punk'
      #   Echonest.playlist_static(:artist => "Daft Punk")
      def playlist_static(options={})
        objects_from_response(Echonest::Song, :get, '/api/v4/playlist/static', :songs, options)
      end

      # Creates a new dynamic playlist session. A dynamic playlist is created with an initial set of parameters that define rules for generating the playlist. A session identifier is returned that can be used with other dynamic methods to get new songs, provide feedback or to steer the playlist. Songs in the playlist can be fetched, one at a time, using the dynamic/next method. The playlist is dynamic in that it is adapted dynamically based on the listener's feedback and steering.
      # The dynamic playlist will adapt the playlist session based upon a number of factors:
      #   Played songs
      #   Skipped songs
      #   Rated songs/artists
      #   Favorited songs/artists
      #   Banned songs/artists
      #   Playlist steering
      # The dynamic/create method accepts the same set of parameters as the playlist/static method with the exception of the results parameter.
      # @see http://developer.echonest.com/docs/v4/playlist.html#dynamic-create
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Echonest::Playlist]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :session_catalog The IDs of catalogs that should be updated with session information (plays, skips, ratings,bans, favorites, etc). Multiple session catalogs can be listed and all will be updated with the same information. The session catalogs must have been previously created using the same API key as used in this call. May use muliple up to 5. Example: 'CAKSMUX1321A708AA4'
      #
      # @option
      # @return [Echonest::Playlist]
      # @example Return a playlist with a session ID
      #   Echonest.playlist_dynamic_create(:artist => "Daft Punk")
      def playlist_dynamic_create(options={})
        response = send(:get, '/api/v4/playlist/dynamic/create', options)
        Echonest::Playlist.fetch_or_new(response[:body][:response])
      end

      # Restarts a playlist session. Given the session ID and a new set of playlist parameters, this method restarts the playlist session based upon the new parameters. The session history is maintained. Everything else is reset. This method takes all the same parameters as dynamic/create, plus the session ID. Returns the given session ID.
      # @see http://developer.echonest.com/docs/v4/playlist.html#dynamic-restart
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Echonest::Playlist]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :session_id ID of session. Required.  Example: '7bf982d80ed8421c8c94dbd6de565e9d'
      #
      # @option
      # @return [Echonest::Playlist]
      # @example Return a playlist with a session ID
      #   Echonest.playlist_dynamic_restart(:session_id => '7bf982d80ed8421c8c94dbd6de565e9d', :artist => "Daft Punk")
      def playlist_dynamic_restart(options={})
        response = send(:get, '/api/v4/playlist/dynamic/restart', options)
        Echonest::Playlist.fetch_or_new(response[:body][:response])
      end

      # Returns the next songs in the playlist. Results includes two lists of songs - one list (called next) contains the next songs to play, the other (called lookahead) contains the lookahead songs (controlled via the lookahead parameter). The next songs returned by this method will be considered to be played starting at the time the call returns. Use the dynamic/feedback method to indicate that the song was skipped or not played.
      # @see http://developer.echonest.com/docs/v4/playlist.html#dynamic-restart
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @return [Echonest::Playlist]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :session_id ID of session. Required.  Example: '7bf982d80ed8421c8c94dbd6de565e9d'
      # @option options [Integer] :results The desired number of next songs returned. Maybe be one of [0, 1, 5]. Requesting zero results, when combined with a non-zero lookahead, allows you to retrieve the next 1-5 songs without any assumptions about songs being played. Requesting zero results returns the lookahead only, no 'results' will be returned. No songs are assumed played nor are any added to the history or any associated session catalogs. The playlist is not advanced. Making consecutive dynamic/next calls with zero results will return the exact same set of lookahead tracks. You must provide feedback (via the dynamic/feedback api), to explicitly play and/or skip songs in the playlist in order to advance the playlist when 'results' is set to zero.
      # @option options [Integer] :lookahead Number of lookahead songs to return. Lookahead songs are the next songs that will be returned to be played if no user feedback or steering occurs before the next dynamic/next method call. Not required, may be 0 to 5.
      #
      # @option
      # @return [Echonest::Playlist]
      # @example Return a playlist with songs and lookaheads
      #   Echonest.playlist_dynamic_next(:session_id => 7bf982d80ed8421c8c94dbd6de565e9d')
      def playlist_dynamic_next(options={})
        response = send(:get, '/api/v4/playlist/dynamic/next', options)
        Echonest::Playlist.fetch_or_new(response[:body][:response])
      end
    end
  end
end
