# frozen_string_literal:true

require 'spec_helper'

RSpec.describe GuidSpanner::Guid do
  subject(:guid_spanner) { described_class }

  let(:valid_32_uuid) { '1be7eaa5aba341e895a653e66be98fef' }
  let(:unpacked_32_uuid) { '1be7eaa5-aba3-41e8-95a6-53e66be98fef' }
  let(:binary_32_uuid) { "\e\xE7\xEA\xA5\xAB\xA3A\xE8\x95\xA6S\xE6k\xE9\x8F\xEF".dup.force_encoding('BINARY') }

  let(:valid_36_uuid) { 'fa49247b-d8c4-4a51-9ffd-28c0d9692b0c' }
  let(:compact_36_uuid) { 'fa49247bd8c44a519ffd28c0d9692b0c' }
  let(:binary_36_uuid) { "\xFAI${\xD8\xC4JQ\x9F\xFD(\xC0\xD9i+\f".dup.force_encoding('BINARY') }

  let(:invalid_32_uuid) { '1be7eaa5aba341e895a653e66be98fe' }
  let(:invalid_36_uuid) { 'fa49247b-d8c4-4a51-9ffd-2c0d9692b0' }

  describe '#unpack_to_36' do
    context 'when a 32 bit guid is provided' do
      it 'expects an unpacked 36 bit uuid' do
        expect(guid_spanner.unpack_to_36(valid_32_uuid)).to eq unpacked_32_uuid
      end
    end

    context 'when a valid 36 bit guid is provided' do
      it 'expects the same uuid is returned' do
        expect(guid_spanner.unpack_to_36(valid_36_uuid)).to eq valid_36_uuid
      end
    end

    context 'when an invalid guid is provided' do
      it 'expects an error to be raised' do
        expect { guid_spanner.unpack_to_36(invalid_32_uuid) }
          .to raise_error(GuidSpanner::Exceptions::InvalidUuidFormatError)
      end
    end
  end

  describe '#pack_to_32' do
    context 'when a 32 bit guid is provided' do
      it 'expects the same uuid to be returned' do
        expect(guid_spanner.pack_to_32(valid_32_uuid)).to eq valid_32_uuid
      end
    end

    context 'when a valid 36 bit guid is provided' do
      it 'expects a compact version of the original guid returned' do
        expect(guid_spanner.pack_to_32(valid_36_uuid)).to eq compact_36_uuid
      end
    end

    context 'when an invalid guid is provided' do
      it 'expects an error to be raised' do
        expect { guid_spanner.pack_to_32(invalid_36_uuid) }
          .to raise_error(GuidSpanner::Exceptions::InvalidUuidFormatError)
      end
    end
  end

  describe '#str_to_bin' do
    context 'when a 32 char guid is provided' do
      it 'expects a binary representation of the 32 char guid to be returned' do
        expect(guid_spanner.str_to_bin(valid_32_uuid)).to eq binary_32_uuid
      end
    end

    context 'when a 36 char guid is provided' do
      it 'expects a binary representation of the 36 char guid to be returned' do
        expect(guid_spanner.str_to_bin(valid_36_uuid)).to eq binary_36_uuid
      end
    end

    context 'when an invalid guid is provided' do
      it 'expects an error to be raised' do
        expect { guid_spanner.str_to_bin(invalid_36_uuid) }
          .to raise_error(GuidSpanner::Exceptions::InvalidUuidFormatError)
      end
    end
  end

  describe '#bin_to_str' do
    context 'when a binary guid is provided' do
      it 'expects a 36 char representation of the binary guid to be returned' do
        expect(guid_spanner.bin_to_str(binary_32_uuid)).to eq unpacked_32_uuid
      end
    end
  end

  describe 'round robin conversions' do
    context 'when a 32 char guid is converted to binary and back to 36 char guid' do
      it 'expects the correct 36 char guid to be returned' do
        guid_bin = guid_spanner.str_to_bin(valid_32_uuid)
        expect(guid_spanner.bin_to_str(guid_bin)).to eq unpacked_32_uuid
      end
    end

    context 'when a 36 char guid is converted to binary and back to 36 char guid' do
      it 'expects the original 36 char guid to be returned' do
        guid_bin = guid_spanner.str_to_bin(valid_36_uuid)
        expect(guid_spanner.bin_to_str(guid_bin)).to eq valid_36_uuid
      end
    end

    context 'when a binary guid is converted to string and back to binary' do
      it 'expects the original binary guid to be returned' do
        guid_str = guid_spanner.bin_to_str(binary_32_uuid)
        expect(guid_spanner.str_to_bin(guid_str)).to eq binary_32_uuid
      end
    end
  end
end
