# frozen_string_literal: true

require 'singleton'

module AwsRekognitionClient
  class Configuration
    include Singleton

    ENDPOINT_TEMPLATE = 'https://rekognition.%s.amazonaws.com/'

    ACCESSORS = %i(
      access_key
      secret_key
      region
      max_labels
      min_confidence
    ).freeze

    attr_accessor(*ACCESSORS)

    def initialize
      @region         = 'eu-west-1'
      @max_labels     = 10
      @min_confidence = 50
    end

    def self.configure
      yield instance
    end

    def self.url
      ENDPOINT_TEMPLATE % instance.region
    end

    def self.respond_to_missing?(method, include_private = false)
      accessor?(method) || super
    end

    def self.method_missing(method, *args)
      super unless accessor?(method.to_s.gsub(/\=$/, '').to_sym)
      instance.public_send(method, *args)
    end

    def self.accessor?(method)
      ACCESSORS.include?(method)
    end
  end
end
