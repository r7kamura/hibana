module Hibana
  module Errors
    class RouterNotSetError < ::RuntimeError
      # @return [String]
      def to_s
        "Can't handle requests because router is not set."
      end
    end
  end
end
