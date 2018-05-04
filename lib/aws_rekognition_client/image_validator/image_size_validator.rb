# frozen_string_literal: true

require_relative 'base_validator'

module AwsRekognitionClient
  class ImageValidator
    class ImageSizeValidator < AwsRekognitionClient::ImageValidator::BaseValidator
      MAX_SIZE = 5_000_000 # bytes

      def validate
        return @valid = true if @image.size < MAX_SIZE

        @valid
      end

      def message
        "Amazon Rekognition accept maximum image size is #{MAX_SIZE / 1_000_000} MB"
      end
    end
  end
end
