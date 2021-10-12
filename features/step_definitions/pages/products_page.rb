require 'capybara'

class ProductsPage < BasicPage
  include Capybara::DSL

  def original_plan_card
    within('.plan-original') do
      yield
    end
  end

  def plus_plan_card
    within('.plan-a-plus') do
      yield
    end
  end

  def product_modal
    within('.modal-dialog') do
      yield
    end
  end

  def click_aspiration_original_button
    original_plan_card { click_button 'Get Aspiration' }
  end

  def click_aspiration_plus_button
    plus_plan_card { click_button 'Get Aspiration Plus' }
  end

  def has_price?(price, plan)
    within find('.option', text: plan) do
      return has_text?("$#{price}") && has_text?("#{plan}") ? true : false
    end
  end

end
