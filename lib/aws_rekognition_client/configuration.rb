# frozen_string_literal: true

require 'singleton'

module AwsRekognitionClient
  class Configuration
    include Singleton

    ENDPOINT_TEMPLATE = 'https://rekognition.%s.amazonaws.com/'

    CREDENTIALS = %i(
      access_key
      secret_key
      region
    ).freeze

    attr_accessor(*CREDENTIALS)

    def initialize
      @region = 'eu-west-1'
    end

    def self.configure
      yield instance
    end

    def self.url
      ENDPOINT_TEMPLATE % instance.region
    end

    def self.credentials
      CREDENTIALS.reduce({}) do |memo, credential|
        memo[credential] = public_send(credential)
        memo
      end
    end

    def self.respond_to_missing?(method, include_private = false)
      accessor?(method) || super
    end

    def self.method_missing(method, *args)
      super unless accessor?(method.to_s.gsub(/\=$/, '').to_sym)

      instance.public_send(method, *args)
    end

    def self.accessor?(method)
      CREDENTIALS.include?(method)
    end
  end
end
