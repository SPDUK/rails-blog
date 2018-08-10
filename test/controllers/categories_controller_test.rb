# frozen_string_literal: true

require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  # make sure we can do a get request the routes

  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get(:show, params: {id: @category.id})
      assert_response :success
    end
end
