# frozen_string_literal: true

# Module for guid spannering classes
module GuidSpanner
  # Class to convert from 32 character guids to 36 character guids and back
  class Guid
    # class method to convert 32-char guid to 36-char version
    def self.unpack_to_36(guid_str)
      raise GuidSpanner::Exceptions::InvalidUuidFormatError unless valid_32?(guid_str) || valid_36?(guid_str)
      return guid_str if guid_str.length == 36
      guid_str.unpack('A8A4A4A4A12').join('-')
    end

    # class method to convert 36-char guid to 32-char version
    def self.pack_to_32(guid_str)
      return guid_str if valid_32?(guid_str)
      raise GuidSpanner::Exceptions::InvalidUuidFormatError unless valid_36?(guid_str)
      guid_str.delete('-')
    end

    class << self
      def valid_32?(guid_str)
        res = guid_str =~ /^([0-9A-Fa-f]{8}[0-9A-Fa-f]{4}[0-9A-Fa-f]{4}[0-9A-Fa-f]{4}[0-9A-Fa-f]{12})$/
        res ? true : false
      end

      def valid_36?(guid_str)
        res = guid_str =~ /^([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})$/
        res ? true : false
      end
    end
  end
end
