require "test_helper"

class DrinksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/drinks.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Drink.count, data.length
  end

  test "create" do
    assert_difference "Drink.count", 1 do
      post "/drinks.json", params: { name: "lake", width: 800, height: 600 }
      assert_response 200
    end
  end

  test "show" do
    get "/drinks/#{Drink.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal [ "id", "name", "color", "created_at", "updated_at" ], data.keys
  end

  test "update" do
    drink = Drink.first
    patch "/drinks/#{drink.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Drink.count", -1 do
      delete "/drinks/#{Drink.first.id}.json"
      assert_response 200
    end
  end
end
