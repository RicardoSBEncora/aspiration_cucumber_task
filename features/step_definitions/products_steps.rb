require_rel '../helpers/paths', 'pages'
require 'capybara'
require 'capybara/rspec'

url_paths = Paths.new()
products = ProductsPage.new()

Then('I can see plans and prices on the product page') do
  expect(page).to have_current_path(url_paths.products)
  expect(page).to have_text('Spend & Save Plans')
  expect(page).to have_text('Investing')
  expect(page).to have_text('Retirement')
  expect(page).to have_text('Giving')
end

Then('I can see Aspiration card') do
  products.original_plan_card do
    expect(page).to have_text("$0")
    expect(page).to have_text("GET ASPIRATION")
  end
end

Then('I can see Aspiration Plus card') do
  products.plus_plan_card do
    expect(page).to have_text("$5.99/mo")
    expect(page).to have_text("GET ASPIRATION PLUS")
  end
end

When('I click on Get Aspiration Plus button') do
  products.click_aspiration_plus_button
end

When('I click on Get Aspiration button') do
  products.click_aspiration_original_button
end

Then('I can see the aspiration sign up modal appear') do
  products.product_modal do
    expect(page).to have_selector('#join-waitlist-input')
    expect(page).to have_selector('div', text: 'Get Started')
  end
end

Then('I can see the aspiration plus modal appear') do
  products.product_modal do
    expect(page).to have_selector('p', text: 'Choose your Aspiration Plus plan')
    expect(page).to have_css('.option', count: 2)
    expect(page).to have_text('Yearly')
    expect(page).to have_text('Monthly')
  end
end

And('I can see yearly radio option is ${float} paid once yearly') do |float|
  expect(products.has_price?(float, 'Yearly')).to be true
end

And('I can see monthly radio option is ${float} paid monthly') do |float|
  expect(products.has_price?(float, 'Monthly')).to be true
end
