module Echowrap
  class Base
    # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
    #
    # @param attrs [Array, Set, Symbol]
    def self.attr_reader(*attrs)
      #@attr_readers ||= []
      #@attr_readers.concat attrs

      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attrs[attribute.to_sym] if @attrs
          end
          define_method "#{attribute}?" do
            !!@attrs[attribute.to_sym]
          end
        end
      end
      const_set(:Attributes, mod)
      include mod
    end

    # @param other [Echowrap::Base]
    # @return [Boolean]
    def ==(other)
      super || attr_equal(:id, other) || attrs_equal(other)
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Echowrap::Base]
    def initialize(attrs={})
      @attrs = attrs
    end

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
    # @return [Echowrap::Base]
    def update(attrs)
      @attrs.update(attrs)
      self
    end

    #def self.attr_readers
      #@attr_readers
    #end

    #def attr_readers
      #self.class.attr_readers
    #end

  protected

    # @param attr [Symbol]
    # @param other [Echowrap::Base]
    # @return [Boolean]
    def attr_equal(attr, other)
      self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
    end

    # @param other [Echowrap::Base]
    # @return [Boolean]
    def attrs_equal(other)
      self.class == other.class && !other.attrs.empty? && attrs == other.attrs
    end

    # @param klass [Class]
    # @param key [Symbol]
    # @return [Array]
    def map_collection(klass, key)
      Array(@attrs[key.to_sym]).map do |entity|
        klass.new(entity)
      end
    end

  end
end
