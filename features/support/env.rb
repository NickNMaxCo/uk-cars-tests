require 'cucumber'
require 'capybara'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'

config_file = YAML.load_file('./configs.yml')

Dir[
  './pages/*.rb'
].each { |f| require f }

Capybara.configure do |config|
  config.run_server = false
  config.app_host = config_file['app_host']
  config.asset_host = config_file['app_host']
  config.default_selector = :css
  config.default_max_wait_time = 2
  config.ignore_hidden_elements = true
  config.match = :one
  config.exact = true
  config.visible_text_only = true
  config.default_driver = config_file['driver'].to_sym
  config.javascript_driver = config_file['driver'].to_sym
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, { browser: config_file['browser'].to_sym })
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    js_errors: true,
    phantomjs_options: ["--ignore-ssl-errors='no'"]
  )
end
