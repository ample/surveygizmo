require 'surveygizmo/error/identity_map_key_error'

module Surveygizmo
  class Base
    attr_reader :attrs
    alias to_hash attrs

    # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
    #
    # @overload self.attr_reader(attr)
    #   @param attr [Symbol]
    # @overload self.attr_reader(attrs)
    #   @param attrs [Array<Symbol>]
    def self.attr_reader(*attrs)
      attrs.each do |attribute|
        class_eval do
          define_method attribute do
            @attrs[attribute.to_sym]
          end
        end
      end
    end

    # return [Surveygizmo::IdentityMap]
    def self.identity_map
      return unless Surveygizmo.identity_map
      @identity_map = Surveygizmo.identity_map.new if @identity_map_class != Surveygizmo.identity_map
      @identity_map_class = Surveygizmo.identity_map
      @identity_map
    end

    # Retrieves an object from the identity map.
    #
    # @param attrs [Hash]
    # @return [Surveygizmo::Base]
    def self.fetch(attrs)
      return unless identity_map
      if object = identity_map.fetch(Marshal.dump(attrs))
        return object
      end
      return yield if block_given?
      raise Surveygizmo::Error::IdentityMapKeyError, "key not found"
    end

    # Stores an object in the identity map.
    #
    # @param object [Object]
    # @return [Surveygizmo::Base]
    def self.store(object)
      return object unless identity_map
      identity_map.store(Marshal.dump(object.attrs), object)
    end

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Surveygizmo::Base]
    def self.from_response(response={})
      fetch_or_new(response.data)
    end

    # Retrieves an object from the identity map, or stores it in the
    # identity map if it doesn't already exist.
    #
    # @param attrs [Hash]
    # @return [Surveygizmo::Base]
    def self.fetch_or_new(attrs={})
      return unless attrs
      return new(attrs) unless identity_map

      fetch(attrs) do
        object = new(attrs)
        store(object)
      end
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Surveygizmo::Base]
    def initialize(attrs={})
      @attrs = attrs
    end

    # Fetches an attribute of an object using hash notation
    #
    # @param method [String, Symbol] Message to send to the object
    def [](method)
      send(method.to_sym)
    rescue NoMethodError
      nil
    end

    # Update the attributes of an object
    #
    # @param attrs [Hash]
    # @return [Surveygizmo::Base]
    def update(attrs)
      @attrs.update(attrs)
      self
    end

  protected

    # @param attr [Symbol]
    # @param other [Surveygizmo::Base]
    # @return [Boolean]
    def attr_equal(attr, other)
      self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
    end

    # @param other [Surveygizmo::Base]
    # @return [Boolean]
    def attrs_equal(other)
      self.class == other.class && !other.attrs.empty? && attrs == other.attrs
    end

  end
end
