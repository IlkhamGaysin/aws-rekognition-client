# frozen_string_literal: true

require_relative 'base_validator'

module AwsRekognitionClient
  class ImageValidator
    class MimeTypeValidator < AwsRekognitionClient::ImageValidator::BaseValidator
      FORMATS = ['png, jpeg'].freeze

      def validate
        return @valid = true if @image.mime_type.match?(/#{FORMATS.join('|')}/)

        @valid
      end

      def message
        "Amazon Rekognition supports #{FORMATS.join(', ')} formats"
      end
    end
  end
end
