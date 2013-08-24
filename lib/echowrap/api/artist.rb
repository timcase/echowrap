require 'echowrap/api/utils'

module Echowrap
  module API
    module Artist
      include Echowrap::API::Utils

      # Get a list of artist biographies.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#biographies
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Biography>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :license The desired license of the returned images. Not required, can send multiple, must be one of ['echo-source', 'all-rights-reserved', 'cc-by-sa', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by', 'public-domain', 'unknown'].
      # @example Biographies via id
      #   Echowrap.artist_biographies(:id => 'ARH6W4X1187B99274F')
      def artist_biographies(options={})
        objects_from_response(Echowrap::Biography, :get, '/api/v4/artist/biographies', :biographies, options)
      end

      # Get a list of artist blogs.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#blogs
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Blog>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :high_relevance If true only items that are highly relevant for this artist will be returned. Not require, must be one of ['true', 'false'].
      # @example blogs via id
      #   Echowrap.artist_blogs(:id => 'ARH6W4X1187B99274F')
      def artist_blogs(options={})
        objects_from_response(Echowrap::Blog, :get, '/api/v4/artist/blogs', :blogs, options)
      end

      # Extract artist names from text.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#extract-beta
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :bucket Indicates what data should be returned with each artist. Not required, may send multiple, must be one of ['biographies', 'blogs', 'doc_counts', 'familiarity', 'hotttnesss', 'images', 'artist_location', 'news', 'reviews', 'songs', 'terms', 'urls', 'video', 'years_active', 'id:Rosetta-space']. Example: 'songs'.
      # @option options [String] :limit If 'true' limit the results to any of the given idspaces or catalogs. Not required, defaults to 'false'.
      # @option options [String] :text Text that contains artist names. Not required.  Example: 'Siriusmo is my favorite, but I also like hrvatski'.
      # @option options [Float] :max_familiarity The maximum familiarity for the artist, the valid range for max_familiairty is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_familiarity The minimum famliiarity for the artist, the valid range for min_familiarity is 1.0 to 0.0, with 0.0 as default.
      # @option options [Float] :max_hotttnesss The maximum hotttnesss of any artist's artist, the valid range for artist_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_hotttnesss The minimum hotttnesss of any artist's artist, the valid range for the artist_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [String] :sort Indicates how the artists results should be ordered. Must be one of ['familiarity-asc', 'hotttnesss-asc', 'familiarity-desc', 'hotttnesss-desc', 'artist_start_year-asc', 'artist_start_year-desc', 'artist_end_year-asc', 'artist_end_year-desc', 'artist_start_year-asc', 'artist_start_year-desc', 'artist_end_year-asc', 'artist_end_year-desc'].
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @return [Array<Echowrap::artist>]
      # @example Return an array of artists with artist 'Daft Punk'
      #   Echowrap.artist_search(:artist => "Daft Punk")
      def artist_extract(options={})
        objects_from_response(Echowrap::Artist, :get, '/api/v4/artist/extract', :artists, options)
      end
      # Get numerical estimation of how familiar an artist currently is to the world.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#familiarity
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Familiarity]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @example familiarity via id
      #   Echowrap.artist_familiarity(:id => 'ARH6W4X1187B99274F')
      def artist_familiarity(options={})
        object_from_response(Echowrap::Familiarity, :get, '/api/v4/artist/familiarity', :artist, options)
      end

      # Get numerical description of how hottt an artist currently is.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#hotttnesss
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Hotttnesss]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @example hotttnesss via id
      #   Echowrap.artist_hotttnesss(:id => 'ARH6W4X1187B99274F')
      def artist_hotttnesss(options={})
        object_from_response(Echowrap::Hotttnesss, :get, '/api/v4/artist/hotttnesss', :artist, options)
      end

      # Get a list of artist images.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#images
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Image>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :license The desired license of the returned images. Not required, can send multiple, must be one of ['echo-source', 'all-rights-reserved', 'cc-by-sa', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by', 'public-domain', 'unknown'].
      # @example images via id
      #   Echowrap.artist_images(:id => 'ARH6W4X1187B99274F')
      def artist_images(options={})
        objects_from_response(Echowrap::Image, :get, '/api/v4/artist/images', :images, options)
      end

      # Get a list of the available genres for use with search and playlisting. This method returns a list of genres suitable for use in the artist/search call when searching by description and for the creation of genre-radio playlists. The returned list of genres is inclusive of all supported genres.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#genres
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @param options [Hash] A customizable set of options.
      # @return [Array<Echowrap::Genre>]
      # @param options [Hash] A customizable set of options.
      # @example artist_list_genres
      #   Echowrap.artist_list_genres
      def artist_list_genres(options={})
        objects_from_response(Echowrap::Genre, :get, '/api/v4/artist/list_genres', :genres, options)
      end

      # Get a list of the available terms for use with search and playlisting. This method returns a list of genres suitable for use in the artist/search call when searching by description and for the creation of genre-radio playlists. The returned list of genres is inclusive of all supported genres.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#terms
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type The type of term that is of interest. Not required, must be one of ['style', 'mood'].
      # @return [Array<Echowrap::term>]
      # @param options [Hash] A customizable set of options.
      # @example artist_list_terms
      #   Echowrap.artist_list_terms
      def artist_list_terms(options={})
        objects_from_response(Echowrap::Term, :get, '/api/v4/artist/list_terms', :terms, options)
      end

      # Get a list of news articles found on the web related to an artist.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#news
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::NewsArticle>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :high_relevance If true only items that are highly relevant for this artist will be returned. Not require, must be one of ['true', 'false'].
      # @example news via id
      #   Echowrap.artist_news(:id => 'ARH6W4X1187B99274F')
      def artist_news(options={})
        objects_from_response(Echowrap::NewsArticle, :get, '/api/v4/artist/news', :news, options)
      end

      # Get basic information about an artist.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::artist] The artist.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'SOCZMFK12AC468668F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [String] :bucket The type of track data that should be returned. Not required, can send multiple, may be any of ['biographies', 'blogs', 'doc_counts', 'familiarity', 'hotttnesss', 'images', 'artist_location', 'news', 'reviews', 'songs', 'terms', 'urls', 'video', 'years_active', 'id:rosetta-stone'].
      # @example Profile via id
      #   Echowrap.artist_profile(:id => 'SOCZMFK12AC468668F')
      def artist_profile(options={})
        object_from_response(Echowrap::Artist, :get, '/api/v4/artist/profile', :artist, options)
      end

      # Search for artists given different query types
      #
      # @see http://developer.echonest.com/docs/v4/artist.html
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :bucket Indicates what data should be returned with each artist. Not required, may send multiple, must be one of ['biographies', 'blogs', 'doc_counts', 'familiarity', 'hotttnesss', 'images', 'artist_location', 'news', 'reviews', 'songs', 'terms', 'urls', 'video', 'years_active', 'id:Rosetta-space']. Example: 'songs'.
      # @option options [String] :limit If 'true' limit the results to any of the given idspaces or catalogs. Not required, defaults to 'false'.
      # @option options [String] :artist_location The name of the location of interest. Not required, location names can optionally be qualified with a type specifier of 'city', 'region', 'city'. Example: 'boston', 'boston+ma+us', 'city:washington', 'region:washington', 'country:united+states'.
      # @option options [String] :name The name of the artist to search for. Not required. Example: 'radiohead'.
      # @option options [String] :description A description of the artist,  Warning Description cannot be used in conjunction with title, artist, combined, or artist_id. Not required, cannot be combined with 'name'. Examples: 'alt-rock','-emo', 'harp^2'. See http://developer.echonest.com/docs/v4/artist.html#search for more examples.
      # @option options [String] :genre A musical genre like rock, jazz, or funky. Not required, may send multiple. Examples are: 'jazz', 'metal'.
      # @option options [String] :style A musical style like rock, jazz, or funky. Not required, may send multiple. Examples are: 'jazz', 'metal^2'.
      # @option options [String] :mood A mood like happy or sad, some examples are: 'happy', 'sad^.5'.
      # @option options [String] :rank_type For search by description, style or mood indicates whether results should be ranked by query relevance or by artist familiarity, must be one of ['relevance', 'familiarity'], with 'relevance' as default
      # @option options [String] :fuzzy_match If 'true', a fuzzy match is performed. Not required, must be one of ['true', 'false'].
      # @option options [Float] :max_familiarity The maximum familiarity for the artist, the valid range for max_familiairty is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_familiarity The minimum famliiarity for the artist, the valid range for min_familiarity is 1.0 to 0.0, with 0.0 as default.
      # @option options [Float] :max_hotttnesss The maximum hotttnesss of any artist's artist, the valid range for artist_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_hotttnesss The minimum hotttnesss of any artist's artist, the valid range for the artist_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [String] :artist_start_year_before Matches artists that have an earliest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_start_year_after Matches artists that have an earliest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_before Matches artists that have an latest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_after Matches artists that have an latest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :sort Indicates how the artists results should be ordered. Must be one of ['familiarity-asc', 'hotttnesss-asc', 'familiarity-desc', 'hotttnesss-desc', 'artist_start_year-asc', 'artist_start_year-desc', 'artist_end_year-asc', 'artist_end_year-desc', 'artist_start_year-asc', 'artist_start_year-desc', 'artist_end_year-asc', 'artist_end_year-desc'].
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @return [Array<Echowrap::artist>]
      # @example Return an array of artists with artist 'Daft Punk'
      #   Echowrap.artist_search(:artist => "Daft Punk")
      def artist_search(options={})
        objects_from_response(Echowrap::Artist, :get, '/api/v4/artist/search', :artists, options)
      end

      # @see http://developer.echonest.com/docs/v4/artist.html#reviews
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Review>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @example reviews via id
      #   Echowrap.artist_reviews(:id => 'ARH6W4X1187B99274F')
      def artist_reviews(options={})
        objects_from_response(Echowrap::Review, :get, '/api/v4/artist/reviews', :reviews, options)
      end

      # Return similar artists given one or more artists for comparison. The Echo Nest provides up-to-the-minute artist similarity and recommendations from their real-time musical and cultural analysis of what people are saying across the Internet and what the music sounds like.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#similar
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :name The name of the artist to search for. Not required. Example: 'radiohead'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :min_results Indicates the minimum number of results to be returned regardless of constraints, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :bucket Indicates what data should be returned with each artist. Not required, may send multiple, must be one of ['biographies', 'blogs', 'doc_counts', 'familiarity', 'hotttnesss', 'images', 'artist_location', 'news', 'reviews', 'songs', 'terms', 'urls', 'video', 'years_active', 'id:Rosetta-space']. Example: 'songs'.
      # @option options [Float] :max_familiarity The maximum familiarity for the artist, the valid range for max_familiairty is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_familiarity The minimum famliiarity for the artist, the valid range for min_familiarity is 1.0 to 0.0, with 0.0 as default.
      # @option options [Float] :max_hotttnesss The maximum hotttnesss of any artist's artist, the valid range for artist_max_hotttnesss is 0.0 to 1.0, with 1.0 as default.
      # @option options [Float] :min_hotttnesss The minimum hotttnesss of any artist's artist, the valid range for the artist_min_hotttnesss is 0.0 to 1.0, with 0.0 as default.
      # @option options [String] :artist_start_year_before Matches artists that have an earliest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_start_year_after Matches artists that have an earliest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_before Matches artists that have an latest start year before the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :artist_end_year_after Matches artists that have an latest start year after the given value, some examples are '1970', '2011', 'present'.
      # @option options [String] :limit If 'true' limit the results to any of the given idspaces or catalogs. Not required, defaults to 'false'.
      # @option options [String] :seed_catalog Only give similars to those in a catalog or catalogs, An Echo Nest artist catalog identifier. Muliple are allowed, up to 5, example: 'CAKSMUX1321A708AA4'.
      # @return [Array<Echowrap::artist>]
      # @example Return an array of artists with artist 'Daft Punk'
      #   Echowrap.artist_similar(:name => "Daft Punk")
      def artist_similar(options={})
        objects_from_response(Echowrap::Artist, :get, '/api/v4/artist/similar', :artists, options)
      end

      # @see http://developer.echonest.com/docs/v4/artist.html#songs
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Song>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @example songs via id
      #   Echowrap.artist_songs(:id => 'ARH6W4X1187B99274F')
      def artist_songs(options={})
        objects_from_response(Echowrap::Song, :get, '/api/v4/artist/songs', :songs, options)
      end

      # Suggest artists based upon partial names. This method will return a list of potential artist matches based upon a query string. The method returns the most familiar best matching artist for the query.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#suggest
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :name A partial artist name.  Not required.  Examples: ["r", "rad", "radioh"].
      # @option options [String] :q A partial artist name (an alias for 'name', to be jQuery friendly). Not required.  Examples: ["r", "rad", "radioh"].
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @return [Array<Echowrap::artist>]
      # @example Return an array of artists with artist 'Daft Pu'
      #   Echowrap.artist_suggest(:name => "Daft Pu")
      def artist_suggest(options={})
        objects_from_response(Echowrap::Artist, :get, '/api/v4/artist/suggest', :artists, options)
      end

      # Get a list of most descriptive terms for an artist
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#terms
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [String] :sort Sort terms based upon weight or frequency. Not required, must be one of ['weight', 'frequency'], with 'frequency' as default.
      # @return [Array<Echowrap::Term>]
      # @example Return an array of terms with name 'Daft Punk'
      #   Echowrap.artist_terms(:name => "Daft Punk")
      def artist_terms(options={})
        objects_from_response(Echowrap::Term, :get, '/api/v4/artist/terms', :terms, options)
      end

      # Return a list of the top hottt artists.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#top_hottt
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :genre A musical genre like rock, jazz, or funky. Not required, may send multiple. Examples are: 'jazz', 'metal'.
      # @option options [String] :bucket Indicates what data should be returned with each artist. Not required, may send multiple, must be one of ['biographies', 'blogs', 'doc_counts', 'familiarity', 'hotttnesss', 'images', 'artist_location', 'news', 'reviews', 'songs', 'terms', 'urls', 'video', 'years_active', 'id:Rosetta-space']. Example: 'songs'.
      # @option options [String] :limit If 'true' limit the results to any of the given idspaces or catalogs. Not required, defaults to 'false'.
      # @return [Array<Echowrap::Artist>]
      # @example Return an array of artists with top genre 'dance'
      #   Echowrap.artist_top_hottt(:genre => "dance")
      def artist_top_hottt(options={})
        objects_from_response(Echowrap::Artist, :get, '/api/v4/artist/top_hottt', :artists, options)
      end

      # Returns a list of the overall top terms.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#top_terms
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @return [Array<Echowrap::Term>]
      # @example Return an array of terms
      #   Echowrap.artist_top_terms
      def artist_top_terms(options={})
        objects_from_response(Echowrap::Term, :get, '/api/v4/artist/top_terms', :terms, options)
      end

      # Gets the twitter handle for an artist
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#twitter
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @return [Array<Echowrap::Term>]
      # @example Return an artist with name of 'Daft Punk'
      #   Echowrap.artist_twitter(:name => "Daft Punk")
      def artist_twitter(options={})
        object_from_response(Echowrap::Artist, :get, '/api/v4/artist/twitter', :artist, options)
      end

      # Get links to the artist's official site, MusicBrainz site, MySpace site, Wikipedia article, Amazon list, and iTunes page.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#urls
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @return [Array<Echowrap::Urls>]
      # @example Return urls for artist with name of 'Daft Punk'
      #   Echowrap.artist_urls(:name => "Daft Punk")
      def artist_urls(options={})
        object_from_response(Echowrap::Urls, :get, '/api/v4/artist/urls', :urls, options)
      end

      # Get a list of video documents found on the web related to an artist.
      # @see http://developer.echonest.com/docs/v4/artist.html#video
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echowrap::Video>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @example video via id
      #   Echowrap.artist_video(:id => 'ARH6W4X1187B99274F')
      def artist_video(options={})
        objects_from_response(Echowrap::Video, :get, '/api/v4/artist/video', :video, options)
      end

    end
  end
end
