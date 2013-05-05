require 'echonest/api/utils'

module Echonest
  module API
    module Artist
      include Echonest::API::Utils

      # Get a list of artist biographies.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#biographies
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echonest::Biography>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :license The desired license of the returned images. Not required, can send multiple, must be one of ['echo-source', 'all-rights-reserved', 'cc-by-sa', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by', 'public-domain', 'unknown'].
      # @example Biographies via id
      #   Echonest.artist_biographies(:id => 'ARH6W4X1187B99274F')
      def artist_biographies(options={})
        biography_objects_from_response(:get, "/api/v4/artist/biographies", options)
      end

      # Get a list of artist blogs.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#blogs
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array<Echonest::Biography>]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @option options [Integer] :results The desired number of results to return, the valid range is 0 to 100, with 15 as the default
      # @option options [Integer] :start The desired index of the first result returned, must be on of [0, 15, 30] with 0 as the default
      # @option options [String] :license The desired license of the returned images. Not required, can send multiple, must be one of ['echo-source', 'all-rights-reserved', 'cc-by-sa', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by', 'public-domain', 'unknown'].
      # @example blogs via id
      #   Echonest.artist_blogs(:id => 'ARH6W4X1187B99274F')
      def artist_blogs(options={})
        blog_objects_from_response(:get, "/api/v4/artist/blogs", options)
      end

      # Get numerical estimation of how familiar an artist currently is to the world.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#familiarity
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::Familiarity]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @example familiarity via id
      #   Echonest.artist_familiarity(:id => 'ARH6W4X1187B99274F')
      def artist_familiarity(options={})
        familiarity_object_from_response(:get, "/api/v4/artist/familiarity", options)
      end

      # Get numerical description of how hottt an artist currently is.
      #
      # @see http://developer.echonest.com/docs/v4/artist.html#hotttnesss
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::Hotttnesss]
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the artist.  Required if name is not provided.  Example: 'ARH6W4X1187B99274F'.
      # @option options [String] :name The name of the artist. Required if id is not provided.  Example: 'Weezer'.
      # @example hotttnesss via id
      #   Echonest.artist_hotttnesss(:id => 'ARH6W4X1187B99274F')
      def artist_hotttnesss(options={})
        hotttnesss_object_from_response(:get, "/api/v4/artist/hotttnesss", options)
      end

      # Search for artists given different query types
      #
      # @see http://developer.echonest.com/docs/v4/artist.html
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
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
      # @return [Array<Echonest::artist>]
      # @example Return an array of artists with artist 'Daft Punk'
      #   Echonest.artist_search(:artist => "Daft Punk")
      def artist_search(options={})
        artist_objects_from_response(:get, "/api/v4/artist/search", options)
      end

      private
        # @param request_method [Symbol]
        # @param path [String]
        # @return [Array]
        def artist_objects_from_response(request_method, path, options={})
          objects_from_array(Echonest::Artist, send(request_method.to_sym, path, options)[:body][:response][:artists])
        end

        # @param request_method [Symbol]
        # @param path [String]
        # @return [Array]
        def biography_objects_from_response(request_method, path, options={})
          objects_from_array(Echonest::Biography, send(request_method.to_sym, path, options)[:body][:response][:biographies])
        end

        # @param request_method [Symbol]
        # @param path [String]
        # @return [Array]
        def blog_objects_from_response(request_method, path, options={})
          objects_from_array(Echonest::Blog, send(request_method.to_sym, path, options)[:body][:response][:blogs])
        end

        # @param request_method [Symbol]
        # @param path [String]
        # @param params [Hash]
        # @return [Echonest::Familiarity]
        def familiarity_object_from_response(request_method, path, options={})
          response = send(request_method.to_sym, path, options)
          Echonest::Familiarity.fetch_or_new(response[:body][:response][:artist])
        end

        # @param request_method [Symbol]
        # @param path [String]
        # @param params [Hash]
        # @return [Echonest::Hotttnesss]
        def hotttnesss_object_from_response(request_method, path, options={})
          response = send(request_method.to_sym, path, options)
          Echonest::Hotttnesss.fetch_or_new(response[:body][:response][:artist])
        end
    end
  end
end
      # @option options [String] :license The desired license of the returned images. Not required, can send multiple, must be one of ['echo-source', 'all-rights-reserved', 'cc-by-sa', 'cc-by-nc', 'cc-by-nc-nd', 'cc-by-nc-sa', 'cc-by-nd', 'cc-by', 'public-domain', 'unknown'].
