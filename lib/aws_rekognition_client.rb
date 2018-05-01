# frozen_string_literal: true

Dir[File.dirname(__FILE__).concat('/**/*.rb')].each { |path| require path }

module AwsRekognitionClient
  BaseError = Class.new(StandardError)

  def self.configure(&block)
  end

  def self.get_labels(image_url)
  end
end
