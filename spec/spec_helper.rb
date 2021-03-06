# frozen_string_literal: true

if ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter ['.bundle', 'spec', 'bin']
    coverage_dir '.coverage'
  end
end

require 'bundler/setup'
require 'pry'
require 'faker'
require 'aws_rekognition_client'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
