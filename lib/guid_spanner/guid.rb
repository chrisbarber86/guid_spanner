# frozen_string_literal: true
require 'uuidtools'

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

    # converts 32-char or 36-char guid to binary-16 (e.g. to store in MySQL  binary(16) GUID column)
    #
    # @param guid_str [String] 32 or 36 character GUID/UUID
    # @return [Binary] Binary representation of guid_str
    def self.str_to_bin(guid_str)
      raise GuidSpanner::Exceptions::InvalidUuidFormatError unless valid_32?(guid_str) || valid_36?(guid_str)
      guid = guid_str.length == 36 ? guid_str : unpack_to_36(guid_str)
      UUIDTools::UUID.parse(guid).raw
    end

    # converts binary-16 guid to 36-char (e.g. to convert guid in MySQL binary(16) GUID column)
    #
    # @param guid_bin [Binary] 16 byte GUID/UUID
    # @return [String] 36 character representation of guid_bin
    def self.bin_to_str(guid_bin)
      UUIDTools::UUID.parse_raw(guid_bin).to_s
    end

    class << self
      def valid_32?(guid_str)
        guid_str =~ /\A\h{32}\z/
      end

      def valid_36?(guid_str)
        guid_str =~ /\A\h{8}(-\h{4}){3}-\h{12}\z/
      end
    end
  end
end
