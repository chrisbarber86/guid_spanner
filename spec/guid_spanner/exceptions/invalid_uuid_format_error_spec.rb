# frozen_string_literal:true

require 'spec_helper'

RSpec.describe GuidSpanner::Exceptions::InvalidUuidFormatError do
  describe 'initialise' do
    it 'expects the default error message to be set correctly' do
      error = described_class.new
      expect(error.message).to eq 'Invalid UUID format, must be 32 or 36 characters in length.'
    end

    it 'expects the custom error message to be set correctly' do
      error = described_class.new('Invalid UUID format, FIX IT!!!')
      expect(error.message).to eq 'Invalid UUID format, FIX IT!!!'
    end
  end
end
