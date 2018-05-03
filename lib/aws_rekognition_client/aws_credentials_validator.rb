# frozen_string_literal: true

module AwsRekognitionClient
  class AwsCredentialsValidator
    VALIDATIONS_MAP = {
      access_key: 'AWS Access Key must be present',
      secret_key: 'AWS Secret Key must be present',
      region: 'AWS region must be present'
    }.freeze

    def self.validate!
      VALIDATIONS_MAP.each do |key, message|
        raise BaseError, message if Configuration.public_send(key).empty?
      end
    end
  end
end
