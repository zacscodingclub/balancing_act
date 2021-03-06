require "simplecov"

SimpleCov.start

require "bundler/setup"
require "balancing_act"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
