require 'capybara'

class BasicPage
  include Capybara::DSL

  def header
    within find('header') do
      yield
    end
  end

  def click_link_in_header(link)
    header { click_link link }
  end
end