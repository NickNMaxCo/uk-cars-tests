require 'cucumber'
require 'capybara'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'

app_host = 'https://www.autotrader.co.uk'

Dir[
  './pages/*.rb'
].each { |f| require f }

Capybara.configure do |config|
  config.run_server = false
  config.app_host = nil
  config.asset_host = app_host
  config.default_selector = :css
  config.default_max_wait_time = 2
  config.ignore_hidden_elements = true
  config.match = :one
  config.exact = true
  config.visible_text_only = true
  config.default_driver = :selenium
  config.javascript_driver = :selenium
end

Selenium::WebDriver::Firefox.driver_path = './geckodriver'

Capybara.use_default_driver

# Capybara.register_driver :selenium do |app|
#   # params = { browser: :firefox }
#   # ff_profile = Selenium::WebDriver::Firefox::Profile.new.tap do |profile|
#   #   profile['network.http.phishy-userpass-length'] = 255
#   #   profile['browser.safebrowsing.malware.enabled'] = false
#   #   profile['network.automatic-ntlm-auth.allow-non-fqdn'] = true
#   #   profile['network.ntlm.send-lm-response'] = true
#   #   profile['network.automatic-ntlm-auth.trusted-uris'] = app_host
#   # end
#   # options = Selenium::WebDriver::Firefox::Options.new(profile: ff_profile)
#   # params[:options] = options
#   Capybara::Selenium::Driver.new(app, params)
# end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    js_errors: true,
    phantomjs_options: ["--ignore-ssl-errors='no'"]
  )
end
