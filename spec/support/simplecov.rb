if ENV['CI']
  require 'simplecov'
  SimpleCov.start { add_filter ['.bundle', 'spec', 'bin'] }
end
