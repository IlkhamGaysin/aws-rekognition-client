require 'singleton'

module AwsRekognitionClient
  class Configuration
    include Singleton

    def initialize
      @access_key     = ENV.fetch('AWS_ACCESS_KEY', nil)
      @secret_key     = ENV.fetch('AWS_SECRET_KEY', nil)
      @region         = ENV.fetch('AWS_REGION', 'eu-west-1')
      @max_labels     = 10
      @min_confidence = 50
    end
  end
end
