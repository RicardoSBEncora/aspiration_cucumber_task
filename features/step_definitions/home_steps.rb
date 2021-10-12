require_rel '../helpers/paths', 'pages'
require 'capybara'
require 'capybara/rspec'
require 'pry'

url_paths = Paths.new()
home = HomePage.new()

Given("I go to Aspiration.com home page") do
  visit url_paths.home
end

When('I click on Spend & Save on navigation bar') do
  home.click_link_in_header('Spend & Save')
end