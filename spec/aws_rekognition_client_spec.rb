# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient do
  it 'has a version number' do
    expect(AwsRekognitionClient::VERSION).not_to be nil
  end

  describe '.configure' do
    let(:instance) { instance_double(AwsRekognitionClient::Configuration) }

    before do
      allow(AwsRekognitionClient::Configuration).to receive(:instance).and_return(instance)
    end

    it 'calls configure on AwsRekognitionClient::Configuration' do
      expect(AwsRekognitionClient::Configuration).to receive(:configure)
      described_class.configure {}
    end
  end
end
