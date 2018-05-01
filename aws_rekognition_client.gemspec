
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_rekognition_client'

Gem::Specification.new do |spec|
  spec.name          = 'aws_rekognition_client'
  spec.version       = AwsRekognitionClient::VERSION
  spec.authors       = ['IlkhamGaysin']
  spec.email         = ['ilgamgaysin@gmail.com']

  spec.summary       = 'Simple http client for AWS Rekognition'
  spec.description   = 'This client allows to get labels for your images'
  spec.homepage      = 'https://github.com/IlkhamGaysin/aws-rekognition-client'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'climate_control'

  spec.add_dependency 'aws4', '0.0.2'
  spec.add_dependency 'faraday', '0.13.1'
end
