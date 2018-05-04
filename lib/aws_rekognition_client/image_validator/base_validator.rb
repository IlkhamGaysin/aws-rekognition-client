# frozen_string_literal: true

module AwsRekognitionClient
  class ImageValidator
    class BaseValidator
      def initialize(image)
        @image = image
        @valid = false
      end

      def validate
        raise NotImplemented
      end

      def valid?
        validate
      end

      def message
        raise NotImplemented
      end
    end
  end
end
