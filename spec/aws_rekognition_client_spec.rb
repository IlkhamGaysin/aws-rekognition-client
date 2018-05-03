# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient do
  it 'has a version number' do
    expect(AwsRekognitionClient::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'calls configure on AwsRekognitionClient::Configuration' do
      allow(AwsRekognitionClient::Configuration).to receive(:configure)
      described_class.configure {}
      expect(AwsRekognitionClient::Configuration).to have_received(:configure)
    end
  end
end
