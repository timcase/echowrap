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
    end
  end
end
