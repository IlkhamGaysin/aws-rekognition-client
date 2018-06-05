# frozen_string_literal: true

module AwsRekognitionClient
  class CredentialsValidator
    VALIDATIONS_MAP = {
      access_key: 'AWS Access Key must be present',
      secret_key: 'AWS Secret Key must be present',
      region: 'AWS region must be present'
    }.freeze

    def self.validate
      new.validate
    end

    def validate
      Configuration.credentials.each do |key, value|
        raise BaseError, VALIDATIONS_MAP[key] if value.to_s.empty?
      end
    end
  end
end
