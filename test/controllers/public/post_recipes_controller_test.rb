require "test_helper"

class Public::PostRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_recipes_show_url
    assert_response :success
  end

  test "should get new" do
    get public_post_recipes_new_url
    assert_response :success
  end

  test "should get create" do
    get public_post_recipes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_recipes_destroy_url
    assert_response :success
  end
end
