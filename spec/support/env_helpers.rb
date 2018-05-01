module EnvHelpers
  def with_modified_env(options, &block)
    ClimateControl.modify(options, &block)
  end
end

RSpec.configure do |config|
  config.include EnvHelpers
end
