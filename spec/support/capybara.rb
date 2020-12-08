# Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver/87.0.4280.20/chromedriver'

Capybara.javascript_driver = :selenium_chrome


RSpec.configure do
  |config| config.before(:each, type: :system) do
    driven_by :rack_test
  end
  
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end 
end
