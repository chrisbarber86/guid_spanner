# frozen_string_literal:true

# module to handle invalid uuid format Exceptions
module GuidSpanner
  # Exceptions module
  module Exceptions
    # Error class for when a message is not applicable for the handler
    class InvalidUuidFormatError < StandardError
      def initialize(message = 'Invalid UUID format, must be 32 or 36 characters in length.')
        super(message)
      end
    end
  end
end
