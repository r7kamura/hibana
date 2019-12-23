require 'tilt'

module Hibana
  class View
    # @param [String, nil] layout_template_path
    # @param [String] partial_template_path
    # @param [Rack::Request] request
    def initialize(layout_template_path: nil, partial_template_path:, request:)
      @layout_template_path = layout_template_path
      @partial_template_path = partial_template_path
      @request = request
    end

    # @return [String]
    def to_s
      if @layout_template_path
        render_layout do
          render_partial
        end
      else
        render_partial
      end
    end

    private

    # @return [Rack::Request]
    attr_reader :request

    # @return [String]
    def render_layout(&block)
      ::Tilt.new(@layout_template_path).render(self, &block)
    end

    # @return [String]
    def render_partial
      ::Tilt.new(@partial_template_path).render(self)
    end
  end
end
