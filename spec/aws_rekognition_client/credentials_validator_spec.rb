# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient::CredentialsValidator do
  describe '.validate' do
    context 'when access key is blank' do
      let(:instance) do
        instance_double(AwsRekognitionClient::Configuration,
          access_key: nil,
          secret_key: Faker::Crypto.sha1,
          region:  "eu-west-2")
      end

      before do
        allow(AwsRekognitionClient::Configuration).to receive(:instance).and_return(instance)
      end

      it 'raises BaseError with corresponding message' do
        expect { described_class.validate }
          .to raise_error(AwsRekognitionClient::BaseError, 'AWS Access Key must be present')
      end
    end

    context 'when secret key is blank' do
      let(:instance) do
        instance_double(AwsRekognitionClient::Configuration,
          secret_key: nil,
          access_key: Faker::Crypto.sha1,
          region:  'eu-west-2')
      end

      before do
        allow(AwsRekognitionClient::Configuration).to receive(:instance).and_return(instance)
      end

      it 'raises BaseError with corresponding message' do
        expect { described_class.validate }
          .to raise_error(AwsRekognitionClient::BaseError, 'AWS Secret Key must be present')
      end
    end

    context 'when region is blank' do
      let(:instance) do
        instance_double(AwsRekognitionClient::Configuration,
          region: nil,
          access_key: Faker::Crypto.sha1,
          secret_key: Faker::Crypto.sha1)
      end

      before do
        allow(AwsRekognitionClient::Configuration).to receive(:instance).and_return(instance)
      end

      it 'raises BaseError with corresponding message' do
        expect { described_class.validate }
          .to raise_error(AwsRekognitionClient::BaseError, 'AWS region must be present')
      end
    end
  end
end
