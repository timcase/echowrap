require 'echonest/api/utils'

module Echonest
  module API
    module TasteProfile
      include Echonest::API::Utils

      # Creates a taste profile.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#create
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :name The name of the taste profile. Required. Example: 'Favorite artists of Paul'.
      # @option options [String] :type The type of the taste profile. Required, must be one of ['artist', 'song', 'general']. Example: 'song'
      #
      # @example taste_profile_create
      #   Echonest.taste_profile_create(:name => "Favorite artists of Paul", :type => 'artist')
      def taste_profile_create(options={})
        response = send(:post, '/api/v4/catalog/create', options)
        Echonest::TasteProfile.fetch_or_new(response[:body][:response])
      end

      # Updates (adds or deletes) items from a taste profile. The body of the post should include an item block that describes modifications to the taste profile.
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#update
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :data The data to be uploaded.  Required, Must be JSON format.  See Echonest API docs for data options
      #
      # @example taste_profile_update
      #   Echonest.taste_profile_update(:name => "Favorite artists of Paul", :type => 'artist')
      def taste_profile_update(options={})
        response = send(:post, '/api/v4/catalog/update', options.merge({:data_type => 'json'}))
        Echonest::TasteProfile.fetch_or_new(response[:body][:response])
      end

      # Retrieve the catalog-level key/values that are stored in the Taste Profile
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#keyvalues
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      #
      # @example taste_profile_keyvalues
      #   Echonest.taste_profile_keyvalues(:id => 'CANVFPJ131839D8144')
      def taste_profile_keyvalues(options={})
        response = send(:get, '/api/v4/catalog/keyvalues', options)
        Echonest::TasteProfile.fetch_or_new(response[:body][:response])
      end

      # Retrieve the catalog-level key/values that are stored in the Taste Profile
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#keyvalues
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Echonest::TasteProfile] The taste profile.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :id The ID of the taste profile. Required. Example: 'CANVFPJ131839D8144'
      # @option options [String] :item The id of the item(s) in the taste profile to be updated. This can be the simple item ID or the Rosetta ID of the item. The items must already be in the taste profile. Examples: 'kfw', 'ARK3D5J1187B9BA0B8', 'CAOFUDS12BB066268E:artist:kfw', '7digital-US:track:293030'
      # @option options [Integer] :play Increments the play count for the specified item(s) by the given value. Not required, defaults to 1, must be between 1 and 100.
      #
      # @example taste_profile_play
      #   Echonest.taste_profile_play(:id => 'CANVFPJ131839D8144', :item => 'kfw')
      def taste_profile_play(options={})
        response = send(:get, '/api/v4/catalog/play', options)
        response[:body][:response][:status][:code] == 0
      end

      # Returns a list of all taste profiles created on this key
      #
      # @see http://developer.echonest.com/docs/v4/taste_profile.html#list
      # @authentication Requires api key
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied api key is not valid.
      # @raise [Echonest::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array]  Array of taste profiles.
      # @param options [Hash] A customizable set of options.
      #
      # @example taste_profile_list
      #   Echonest.taste_profile_list
      def taste_profile_list(options={})
        objects_from_response(Echonest::TasteProfile, :get, '/api/v4/catalog/list', :catalogs, options)
      end
    end
  end
end
