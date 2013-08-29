
module Echowrap
  module API
    module Utils

      SUCCESS = 0
      MISSING_OR_INVALID_KEY = 1
      API_KEY_CANNOT_CALL_THIS_METHOD = 2
      RATE_LIMIT_EXCEEDED = 3
      MISSING_PARAMETER = 4
      INVALID_PARAMETER = 5

      private

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def objects_from_response(klass, request_method, path, object_key, options={})
        response = send(request_method.to_sym, path, options)[:body][:response][object_key] || []
        objects_from_array(klass, response)
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def objects_from_array(klass, array)
        array.map do |element|
          klass.new(element)
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param object_key [Symbol]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, object_key, options={})
        response = send(request_method.to_sym, path, options)[:body][:response]
        response = response[object_key] if object_key
        klass.new(response)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def boolean_from_response(request_method, path, options={})
        response = send(request_method.to_sym, path, options)
        response[:body][:response][:status][:code] == SUCCESS
      end
    end
  end
end
