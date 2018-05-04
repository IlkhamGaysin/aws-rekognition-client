# frozen_string_literal: true

require 'faraday'
require 'json'

Dir[File.dirname(__FILE__).concat('/**/*.rb')].each { |path| require path }

module AwsRekognitionClient
  BaseError = Class.new(StandardError)

  def self.configure(&block)
    Configuration.configure(&block)
  end

  def self.get_labels(image_url)
  end
end
