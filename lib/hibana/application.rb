require 'hanami/router'
require 'rack'

module Hibana
  class Application
    class << self
      # @return [Hibana::Router, nil]
      attr_accessor :router

      # @param [Hash{String => Object}] env
      # @return [Array]
      def call(env)
        rack_application.call(env)
      end

      # Set routes using hanami-router DSL.
      def route(&block)
        self.router = ::Hanami::Router.new(&block)
      end

      def middleware
        @middleware ||= ::Rack::Builder.new
      end

      private

      def rack_application
        @rack_application ||= begin
          middleware.run(new)
          middleware.to_app
        end
      end
    end

    # @param [Hash{String => Object}] env
    # @return [Array]
    def call(env)
      unless self.class.router
        raise ::Hibana::Errors::RouterNotSetError
      end

      self.class.router.call(env)
    end
  end
end
