# frozen_string_literal: true

module AwsRekognitionClient
  module DetectLabels
    class Response < Dry::Struct
      ORIENTATION_CORRECTION_VALUES = %w(ROTATE_0 ROTATE_90 ROTATE_180 ROTATE_270)

      BASE_TRANSFORMATION_KEYS = -> (key) do
        key.downcase.to_sym
      end

      TRANSFORMATIONS_KEYS = -> (key) do
        return :orientation_correction if key.to_s == 'OrientationCorrection'
        return :bounding_box if key.to_s == 'BoundingBox'

        BASE_TRANSFORMATION_KEYS.call(key)
      end

      transform_keys(TRANSFORMATIONS_KEYS)

      attribute :orientation_correction, Types::Strict::String.enum(*ORIENTATION_CORRECTION_VALUES)
      attribute :labels, Types::Strict::Array.of(Dry::Struct) do
        transform_keys(BASE_TRANSFORMATION_KEYS)

        attribute :confidence, Types::Strict::Float
        attribute :name, Types::Strict::String

        attribute :instances, Types::Strict::Array.of(Dry::Struct) do
          transform_keys(BASE_TRANSFORMATION_KEYS)

          attribute :confidence, Types::Strict::Float

          attribute :bounding_box, Types::Strict::Array.of(Dry::Struct) do
            attribute :height, Types::Strict::Float
            attribute :left, Types::Strict::Float
            attribute :top, Types::Strict::Float
            attribute :width, Types::Strict::Float
          end
        end

        attribute :parents, Types::Strict::Array.of(Dry::Struct) do
          transform_keys(BASE_TRANSFORMATION_KEYS)

          attribute :name, Types::Strict::String
        end
      end
    end
  end
end
