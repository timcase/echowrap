require 'echowrap/api/utils'

module Echowrap
  module API
    module TasteProfile
      include Echowrap::API::Utils

      # Creates a taste profile.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#create
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :name The name of the taste profile. Required. Example: 'Favorite artists of Paul'.
      # @option options [String] :type The type of the taste profile. Required, must be one of ['artist', 'song', 'general']. Example: 'song'
      #
      # @example taste_profile_create
      #   Echowrap.taste_profile_create(:name => "Favorite artists of Paul", :type => 'artist')
      def taste_profile_create(options={})
        object_from_response(Echowrap::TasteProfile, :post, '/api/v4/catalog/create', nil, options)
      end

      # Updates (adds or deletes) items from a taste profile. The body of the post should include an item block that describes modifications to the taste profile.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#update
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :data The data to be uploaded.  Required, Must be JSON format.  See Echowrap API docs for data options
      #
      # @example taste_profile_update
      #   Echowrap.taste_profile_update(:name => "Favorite artists of Paul", :type => 'artist')
      def taste_profile_update(options={})
        object_from_response(Echowrap::TasteProfile,
                             :post,
                             '/api/v4/catalog/update',
                             nil,
                             options.merge({:data_type => 'json'}))
      end

      # Retrieve the catalog-level key/values that are stored in the Taste Profile
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#keyvalues
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      #
      # @example taste_profile_keyvalues
      #   Echowrap.taste_profile_keyvalues(:id => 'CANVFPJ131839D8144')
      def taste_profile_keyvalues(options={})
        object_from_response(Echowrap::TasteProfile, :get, '/api/v4/catalog/keyvalues', nil, options)
      end

      # Increment the playcount for the given items by the given count.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#play
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Boolean] Message success.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :item The id of the item(s) in the taste profile to be updated. This can be the simple item ID or the Rosetta ID of the item. The items must already be in the taste profile. Examples: 'kfw', 'ARK3D5J1187B9BA0B8', 'CAOFUDS12BB066268E:artist:kfw', '7digital-US:track:293030'
      # @option options [Integer] :plays Increments the play count for the specified item(s) by the given value. Not required, defaults to 1, must be between 1 and 100.
      #
      # @example taste_profile_play
      #   Echowrap.taste_profile_play(:id => 'CANVFPJ131839D8144', :item => 'kfw')
      def taste_profile_play(options={})
        boolean_from_response(:get, '/api/v4/catalog/play', options)
      end

      # Increment the skip count for the given items by the given count
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#skip
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Boolean] Message success
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :item The id of the item(s) in the taste profile to be updated. This can be the simple item ID or the Rosetta ID of the item. The items must already be in the taste profile. Examples: 'kfw', 'ARK3D5J1187B9BA0B8', 'CAOFUDS12BB066268E:artist:kfw', '7digital-US:track:293030'
      # @option options [Integer] :skips Increments the skip count for the specified item(s) by the given value. Not required, defaults to 1, must be between 1 and 100.
      #
      # @example taste_profile_skip
      #   Echowrap.taste_profile_skip(:id => 'CANVFPJ131839D8144', :item => 'kfw')
      def taste_profile_skip(options={})
        boolean_from_response(:get, '/api/v4/catalog/skip', options)
      end

      # Indicates that the given items have been banned or unbanned.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#ban
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Boolean] Message success
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :item The id of the item(s) in the taste profile to be updated. This can be the simple item ID or the Rosetta ID of the item. The items must already be in the taste profile. Examples: 'kfw', 'ARK3D5J1187B9BA0B8', 'CAOFUDS12BB066268E:artist:kfw', '7digital-US:track:293030'
      # @option options [Integer] :ban Sets the ban flag of the specified items(s) to the given value. Not required, defaults to 'true', must be one of ['true', 'false'].
      #
      # @example taste_profile_ban
      #   Echowrap.taste_profile_ban(:id => 'CANVFPJ131839D8144', :item => 'kfw')
      def taste_profile_ban(options={})
        boolean_from_response(:get, '/api/v4/catalog/ban', options)
      end

      # Indicates that the given items have been favorited or unfavorited.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#favorite
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Boolean] Message success.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :item The id of the item(s) in the taste profile to be updated. This can be the simple item ID or the Rosetta ID of the item. The items must already be in the taste profile. Examples: 'kfw', 'ARK3D5J1187B9BA0B8', 'CAOFUDS12BB066268E:artist:kfw', '7digital-US:track:293030'
      # @option options [String] :favorite Sets the favorite flag of the specified items(s) to the given value. Not required, defaults to 'true', must be either ['true, 'false'].
      #
      # @example taste_profile_favorite
      #   Echowrap.taste_profile_favorite(:id => 'CANVFPJ131839D8144', :item => 'kfw')
      def taste_profile_favorite(options={})
        boolean_from_response(:get, '/api/v4/catalog/favorite', options)
      end

      # Apply the given rating to the given items
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#rate
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Boolean] Message success.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :item The id of the item(s) in the taste profile to be updated. This can be the simple item ID or the Rosetta ID of the item. The items must already be in the taste profile. Examples: 'kfw', 'ARK3D5J1187B9BA0B8', 'CAOFUDS12BB066268E:artist:kfw', '7digital-US:track:293030'
      # @option options [Integer] :rating Sets the rating of the specified items(s) to the given value. Not required, defaults to 5, must be between 1 and 10.
      #
      # @example taste_profile_rate
      #   Echowrap.taste_profile_rate(:id => 'CANVFPJ131839D8144', :item => 'kfw')
      def taste_profile_rate(options={})
        boolean_from_response(:get, '/api/v4/catalog/rate', options)
      end

      # Returns a list of all taste profiles created on this key
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#list
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array]  Array of taste profiles.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :results The number of results desired.
      # @option options [Integer] :start The desired index of the first result returned.
      #
      # @example taste_profile_list
      #   Echowrap.taste_profile_list
      def taste_profile_list(options={})
        objects_from_response(Echowrap::TasteProfile, :get, '/api/v4/catalog/list', :catalogs, options)
      end

      # Deletes the entire taste profile. Only the API key used to create a taste profile can be used to delete that taste profile.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#delete
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile]  The taste profiles.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      #
      # @example taste_profile_delete
      #   Echowrap.taste_profile_delete
      def taste_profile_delete(options={})
        object_from_response(Echowrap::TasteProfile, :post, '/api/v4/catalog/delete', nil, options)
      end

      # Get basic information on a taste profile
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#profile
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile]  The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required if name is omitted. Example: 'CAJTFEO131216286ED'.
      # @option options [String] :name The name of the taste profile. Required if the ID is omitted. Example: 'My Favorite Artists'.
      #
      # @example taste_profile_profile
      #   Echowrap.taste_profile_profile
      def taste_profile_profile(options={})
        object_from_response(Echowrap::TasteProfile, :get, '/api/v4/catalog/profile', :catalog, options)
      end

      # Returns data stored in the taste profile. Also returns Echo Nest IDs for items that have been resolved to Echo Nest IDs along with information requested via bucket. If item_id is not set, all items (subject to the limits of the start and results parameters) are returned, otherwise, only the items explicitly specified by item_id are returned.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#status
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile]  The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required if name is omitted. Example: 'CAJTFEO131216286ED'.
      # @option options [String] :item_id The item id for the item in the taste profile. Not required, can send multiple. ID will be whatever ID was assigned for the item.
      # @option options [String] :bucket Indicates what data should be returned for each item. Not required, can send multiple. Can by any of the following 'item_keyvalues', For song items: 'audio_summary', 'artist_familiarity', 'artist_hotttnesss', 'artist_location', 'song_hotttnesss', 'song_type', 'tracks', 'id:Rosetta-space' For artist items: 'biographies', 'blogs', 'doc_counts', 'familiarity', 'hotttnesss', 'images', 'artist_location', 'news', 'reviews', 'songs', 'terms', 'urls', 'video', 'years_active', 'id:Rosetta-space'
      # @option options [Integer] :results The number of results desired.
      # @option options [Integer] :start The desired index of the first result returned.
      #
      # @example taste_profile_read
      #   Echowrap.taste_profile_read
      def taste_profile_read(options={})
        object_from_response(Echowrap::TasteProfile, :get, '/api/v4/catalog/read', :catalog, options)
      end

      # Checks the status of a taste profile update.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#status
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::Status]  The taste profile status.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :ticket The ticket to check (returned by upload or update). Required. Example: 'e0ba094bbf98cd006283aa7de6780a83'.
      #
      # @example taste_profile_status
      #   Echowrap.taste_profile_status(:ticket => 'e0ba094bbf98cd006283aa7de6780a83')
      def taste_profile_status(options={})
        object_from_response(Echowrap::Status, :get, '/api/v4/catalog/status', nil, options)
      end

      # Returns feeds based on the artists in a taste profile. Unlike catalog/read method, the catalog/feed method interleaves items and sorts them by date.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#list
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array]  Array of feeds
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required if name is omitted. Example: 'CAJTFEO131216286ED'.
      # @option options [String] :bucket Indicates what type of feed items should be returned for each artist in the taste profile. Not required, may send multiple. can be any combination of news, blogs, reviews, audio and video blogs. If omitted defaults to news.
      # @option options [Integer] :results The number of results desired. Not required, defaults to 25.
      # @option options [Integer] :start The desired index of the first result returned. Not required, defaults to 0.
      # @option options [String] :since Limit the items to those that have occurred since the given date. Not required, if supplied must be in date format YYYY-mm-dd. Example: '2013-05-19'.
      # @option options [String] :high_relevance if true only items that are highly relevant for this artist will be returned. Currently only news items are filtered for high relevance. Not required, defaults to 'false', must be one of ['true', 'false'].
      #
      # @example taste_profile_feed
      #   Echowrap.taste_profile_feed
      def taste_profile_feed(options={})
        objects_from_response(Echowrap::Feed, :get, '/api/v4/catalog/feed', :feed, options)
      end

      # Returns a list of all taste profiles that are similar to the given set of taste profiles. This method returns similar taste profiles of the given use type. Similarity search is restricted to taste profiles that were created with the caller's API key.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#similar
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array]  Array of taste profiles
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required, can send multiple up to 10. Example: 'CAJTFEO131216286ED'.
      # @option options [Integer] :results The number of results desired. Not required, defaults to 25.
      # @option options [Integer] :start The desired index of the first result returned. Not required, defaults to 0.
      # @option options [String] :keyvalue Restrict results to taste profiles that have the given key/value pair. If no value is given, restrict results to all taste profiles that have the given key. Not required, may send multiple, Examples: ['yob', 'gender:female', 'zipcode:03103']
      #
      # @example taste_profile_similar
      #   Echowrap.taste_profile_similar
      def taste_profile_similar(options={})
        objects_from_response(Echowrap::TasteProfile, :get, '/api/v4/catalog/similar', :catalogs, options)
      end

      # Access the taste profile attributes.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#predict
      # @authentication Requires api key
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echowrap::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echowrap::TasteProfile]  The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CAJTFEO131216286ED'.
      # @option options [String] :category The attributes to be returned for the taste profile. Required, may send multiple, must be any of ['adventurousness', 'diversity', 'freshness', 'mainstreamness', 'top_years', 'top_styles', 'audio_features'] (audio features is only available for song-based profiles).
      #
      # @example taste_profile_predict
      #   Echowrap.taste_profile_predict
      def taste_profile_predict(options={})
        object_from_response(Echowrap::TasteProfile, :get, '/api/v4/catalog/predict', :catalog, options)
      end
    end
  end
end
