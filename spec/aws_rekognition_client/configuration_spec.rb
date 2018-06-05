# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient::Configuration do
  describe '.url' do
    let(:instance) { instance_double(described_class, region: 'eu-west-1') }

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'returns AWS Rekognition endpoint with default region' do
      expect(described_class.url).to eql('https://rekognition.eu-west-1.amazonaws.com/')
    end
  end

  describe '.access_key' do
    let(:access_key) { Faker::Crypto.sha1 }
    let(:instance)   { instance_double(described_class, access_key: access_key) }

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'returns access key' do
      expect(described_class.access_key).to eql(access_key)
    end
  end

  describe '.secret_key' do
    let(:secret_key) { Faker::Crypto.sha1 }
    let(:instance)   { instance_double(described_class, secret_key: secret_key) }

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'returns secret key' do
      expect(described_class.secret_key).to eql(secret_key)
    end
  end

  describe '.region' do
    context 'when instance is mocked' do
      let(:region)   { 'eu-west-3' }
      let(:instance) { instance_double(described_class, region: region) }

      before do
        allow(described_class).to receive(:instance).and_return(instance)
      end

      it 'returns region' do
        expect(described_class.region).to eql(region)
      end
    end

    context 'when instance is not mocked' do
      it 'returns default region' do
        expect(described_class.region).to eql('eu-west-1')
      end
    end
  end

  describe '.other_method' do
    it 'raises NoMethodError error' do
      expect { described_class.other_method }.to raise_error(NoMethodError)
    end
  end

  describe '.access_key=' do
    let(:access_key) { Faker::Crypto.sha1 }

    let(:instance) do
      fake = Class.new { attr_accessor :access_key }
      fake.new
    end

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'changes access key' do
      expect { described_class.access_key = access_key }
        .to change(described_class, :access_key).from(nil).to(access_key)
    end
  end

  describe '.secret_key=' do
    let(:secret_key) { Faker::Crypto.sha1 }

    let(:instance) do
      fake = Class.new { attr_accessor :secret_key }
      fake.new
    end

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'changes secret key' do
      expect { described_class.secret_key = secret_key }
        .to change(described_class, :secret_key).from(nil).to(secret_key)
    end
  end

  describe '.region=' do
    let(:region) { 'eu-west-2' }

    let(:instance) do
      fake = Class.new { attr_accessor :region }
      fake.new
    end

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'changes region' do
      expect { described_class.region = region }
        .to change(described_class, :region).from(nil).to(region)
    end
  end

  describe '.respond_to_missing?' do
    context 'when called method is present in AwsRekognitionClient::CREDENTIALS' do
      it 'responds to method' do
        expect(described_class).to respond_to(:access_key)
      end
    end

    context 'when called method is not present in AwsRekognitionClient::CREDENTIALS' do
      it 'does not respond to method' do
        expect(described_class).not_to respond_to(:other_method)
      end
    end
  end

  describe '.configure' do
    let(:instance) do
      fake = Class.new { attr_accessor :min_confidence }
      fake.new
    end

    before do
      allow(described_class).to receive(:instance).and_return(instance)
    end

    it 'yields with instance' do
      expect { |b| described_class.configure(&b) }.to yield_with_args(instance)
    end
  end
end
