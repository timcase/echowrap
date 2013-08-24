require 'faraday'
require 'echowrap/error/bad_gateway'
require 'echowrap/error/bad_request'
require 'echowrap/error/forbidden'
require 'echowrap/error/gateway_timeout'
require 'echowrap/error/internal_server_error'
require 'echowrap/error/not_acceptable'
require 'echowrap/error/not_found'
require 'echowrap/error/service_unavailable'
require 'echowrap/error/too_many_requests'
require 'echowrap/error/unauthorized'
require 'echowrap/error/unprocessable_entity'

module Echowrap
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        status_code = env[:status].to_i
        error_class = @klass.errors[status_code]
        raise error_class.from_response(env) if error_class
      end

      def initialize(app, klass)
        @klass = klass
        super(app)
      end

    end
  end
end
