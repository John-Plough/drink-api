require "test_helper"

class DrinksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/drinks.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Drink.count, data.length
  end
end
