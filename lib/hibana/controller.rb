require 'rack'

module Hibana
  class Controller
    DEFAULT_RESPONSE_BODY = ''
    DEFAULT_RESPONSE_STATUS = 200

    class << self
      # @param [Hash{String => Object}] env
      # @return [Array]
      def call(env)
        controller = new(env: env)
        controller.call
        controller.to_rack_spec_response
      end
    end

    # @return [Rack::Response]
    attr_reader :response

    # @param [Hash{String => Object}] env
    def initialize(env:)
      @env = env
      @response = ::Rack::Response.new(
        DEFAULT_RESPONSE_BODY,
        DEFAULT_RESPONSE_STATUS
      )
    end

    def call
      raise ::NotImplementedError
    end

    # @return [Hash{Symbol => String}]
    def path_parameters
      request.env['router.params']
    end

    # @todo
    # @return [Hash{Symbol => String}]
    def parameters
      path_parameters
    end

    # @return [Rack::Request]
    def request
      @request ||= ::Rack::Request.new(@env)
    end

    # @private
    # @return [Array]
    def to_rack_spec_response
      [
        @response.status,
        @response.headers,
        @response.body,
      ]
    end
  end
end
