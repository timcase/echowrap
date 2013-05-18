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
      
    end
  end
end