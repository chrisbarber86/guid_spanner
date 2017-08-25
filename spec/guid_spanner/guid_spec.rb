# frozen_string_literal:true

require 'spec_helper'

RSpec.describe GuidSpanner::Guid do
  subject(:guid_spanner) { described_class }

  let(:valid_32_uuid) { '1be7eaa5aba341e895a653e66be98fef' }
  let(:unpacked_32_uuid) { '1be7eaa5-aba3-41e8-95a6-53e66be98fef' }

  let(:valid_36_uuid) { 'fa49247b-d8c4-4a51-9ffd-28c0d9692b0c' }
  let(:compact_36_uuid) { 'fa49247bd8c44a519ffd28c0d9692b0c' }

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
end
