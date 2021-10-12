require 'capybara/cucumber'
require 'capybara/dsl'
require 'pry'
require 'require_all'
require 'selenium-webdriver'
require 'webdrivers'

Capybara.run_server = false
Capybara.app_host = "https://www.aspiration.com/"
Capybara.default_driver = :headless_chrome


Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[headless enable-features=NetworkService,NetworkServiceInProcess]
    }
  )

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome