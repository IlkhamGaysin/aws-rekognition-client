# frozen_string_literal: true

require_relative 'image_validator/image_size_validator'
require_relative 'image_validator/mime_type_validator'

module AwsRekognitionClient
  class ImageValidator
    VALIDATOR_CLASSES = [
      AwsRekognitionClient::ImageValidator::ImageSizeValidator,
      AwsRekognitionClient::ImageValidator::MimeTypeValidator
    ].freeze

    def initialize(image)
      @image = image
    end

    def self.validate(image)
      new(image).validate
    end

    def validate
      VALIDATOR_CLASSES.each do |validator_class|
        validator = validator_class.new(image)

        raise BaseError, validator.message unless validator.valid?
      end
    end
  end
end
