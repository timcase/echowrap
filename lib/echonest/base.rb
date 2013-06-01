require 'echonest/error/identity_map_key_error'

module Echonest
  class Base
    # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
    #
    # @param attrs [Array, Set, Symbol]
    def self.attr_reader(*attrs)
      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attrs[attribute.to_sym]
          end
          define_method "#{attribute}?" do
            !!@attrs[attribute.to_sym]
          end
        end
      end
      const_set(:Attributes, mod)
      include mod
    end

    # return [Echonest::IdentityMap]
    # def self.identity_map
    #   return unless Echonest.identity_map
    #   @identity_map = Echonest.identity_map.new unless defined?(@identity_map) && @identity_map.class == Echonest.identity_map
    #   @identity_map
    # end
    
    # @param other [Echonest::Identity]
    # @return [Boolean]
    def ==(other)
      super || attr_equal(:id, other) || attrs_equal(other)
    end

    # @return [Integer]
    # def id
    #   @attrs[:id]
    # end

    # Retrieves an object from the identity map.
    #
    # @param attrs [Hash]
    # @return [Echonest::Base]
    #def self.fetch(attrs)
      #return unless identity_map
      #if object = identity_map.fetch(Marshal.dump(attrs))
        #return object
      #end
      #return yield if block_given?
      #raise Echonest::Error::IdentityMapKeyError, "key not found"
    #end

    # Stores an object in the identity map.
    #
    # @param object [Object]
    # @return [Echonest::Base]
    #def self.store(object)
      #return object unless identity_map
      #identity_map.store(Marshal.dump(object.attrs), object)
    #end

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Echonest::Base]
    #def self.from_response(response={})
      #fetch_or_new(response[:body])
    #end

    # Retrieves an object from the identity map, or stores it in the
    # identity map if it doesn't already exist.
    #
    # @param attrs [Hash]
    # @return [Echonest::Base]
    def self.fetch_or_new(attrs={})
      return unless attrs
      return new(attrs) #unless identity_map

      #fetch(attrs) do
        #object = new(attrs)
        #store(object)
      #end
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Echonest::Base]
    def initialize(attrs={})
      @attrs = attrs
    end

    # Fetches an attribute of an object using hash notation
    #
    # @param method [String, Symbol] Message to send to the object
    #def [](method)
      #send(method.to_sym)
    #rescue NoMethodError
      #nil
    #end

    # Retrieve the attributes of an object
    #
    # @return [Hash]
    def attrs
      @attrs
    end
    alias to_hash attrs

    # Update the attributes of an object
    #
    # @param attrs [Hash]
    # @return [Echonest::Base]
    def update(attrs)
      @attrs.update(attrs)
      self
    end

  protected
    
    # @param attr [Symbol]
    # @param other [Echonest::Base]
    # @return [Boolean]
    def attr_equal(attr, other)
      self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
    end

    # @param other [Echonest::Base]
    # @return [Boolean]
    def attrs_equal(other)
      self.class == other.class && !other.attrs.empty? && attrs == other.attrs
    end

    # @param klass [Class]
    # @param key [Symbol]
    # @return [Array]
    def map_collection(klass, key)
      Array(@attrs[key.to_sym]).map do |entity|
        klass.fetch_or_new(entity)
      end
    end


  end
end
