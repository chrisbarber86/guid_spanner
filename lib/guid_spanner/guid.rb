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
        !! (guid_str =~ /\A\h{8}(\h{4}){3}\h{12}\z/)
      end

      def valid_36?(guid_str)
        !! (guid_str =~ /\A\h{8}(-\h{4}){3}-\h{12}\z/)
      end
    end
  end
end
