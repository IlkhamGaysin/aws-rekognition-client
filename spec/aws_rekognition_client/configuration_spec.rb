# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient::Configuration do
  describe '.url' do
    it 'returns AWS Rekognition endpoint with default region' do
      expect(described_class.url).to eql('https://rekognition.eu-west-1.amazonaws.com/')
    end
  end

  describe '.access_key' do
    it 'returns Access Key' do
      expect(described_class.access_key).to be_nil
    end
  end

  describe '.secret_key' do
    it 'returns AWS Credentials from current environment' do
      expect(described_class.secret_key).to be_nil
    end
  end
  describe '.region' do
    it 'returns default region' do
      expect(described_class.region).to eql('eu-west-1')
    end
  end
end
