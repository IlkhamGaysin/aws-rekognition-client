# frozen_string_literal: true

if ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter ['.bundle', '.coverage', 'spec', 'bin']
    coverage_dir '.coverage'
    coverage_dir ENV.fetch('COVERAGE_DIR', '.coverage')
  end
end

require 'bundler/setup'
require 'pry'
require 'faker'
require 'aws_rekognition_client'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!

  config.order = :random

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
