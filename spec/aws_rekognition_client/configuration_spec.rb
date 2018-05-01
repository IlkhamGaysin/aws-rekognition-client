# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient::Configuration do
  describe '.url' do
    it 'returns AWS Rekognition endpoint with a region' do
      with_modified_env AWS_REGION: 'custom-region' do
        expect(described_class.region).to eql('custom-region')
      end
    end
  end
end
