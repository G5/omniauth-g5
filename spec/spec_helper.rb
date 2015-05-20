require 'simplecov'
SimpleCov.start 'test_frameworks'

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'rspec/its'
require 'pry'
require 'omniauth-g5'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

require 'webmock/rspec'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before { OmniAuth.config.test_mode = true }
  config.after { OmniAuth.config.test_mode = false }

  config.after(:suite) { WebMock.disable! }
end
