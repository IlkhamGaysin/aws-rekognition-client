# frozen_string_literal: true

require 'faraday'
require 'json'
require 'dry-types'
require 'dry-struct'
require 'aws_rekognition_client/types'

Dir[File.dirname(__FILE__).concat('/**/*.rb')].each { |path| require path }

module AwsRekognitionClient
  BaseError = Class.new(StandardError)

  def self.configure(&block)
    Configuration.configure(&block)
  end

  def self.get_labels_for(file)
    DetectLabels::From.call(file)
  end
end
