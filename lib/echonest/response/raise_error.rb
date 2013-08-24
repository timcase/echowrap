require 'faraday'
require 'echonest/error/bad_gateway'
require 'echonest/error/bad_request'
require 'echonest/error/forbidden'
require 'echonest/error/gateway_timeout'
require 'echonest/error/internal_server_error'
require 'echonest/error/not_acceptable'
require 'echonest/error/not_found'
require 'echonest/error/service_unavailable'
require 'echonest/error/too_many_requests'
require 'echonest/error/unauthorized'
require 'echonest/error/unprocessable_entity'

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
