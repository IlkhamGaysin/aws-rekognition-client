# frozen_string_literal: true

require 'singleton'

module AwsRekognitionClient
  class Configuration
    include Singleton

    ENDPOINT_TEMPLATE = 'https://rekognition.%s.amazonaws.com/'

    AWS_CREDENTIAL_KEYS = %i(
      access_key
      secret_key
      region
      max_labels
      min_confidence
    ).freeze

    attr_accessor(*AWS_CREDENTIAL_KEYS)

    def initialize
      @access_key     = ENV.fetch('AWS_ACCESS_KEY', nil)
      @secret_key     = ENV.fetch('AWS_SECRET_KEY', nil)
      @region         = ENV.fetch('AWS_REGION', 'eu-west-1')
      @max_labels     = 10
      @min_confidence = 50
    end

    def self.configure
      yield instance
    end

    def self.url
      ENDPOINT_TEMPLATE % instance.region
    end
  end
end
