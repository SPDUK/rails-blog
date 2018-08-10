# frozen_string_literal: true

require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  # a post request should
  test "get new category form and create category" do
    get new_category_path
    # going to new category path
    assert_template "categories/new"
    # posting to new category form and redirecting
    assert_difference "Category.count", 1 do
      # the index page should have this category of sports
      post categories_path, params: {category: {name: "sports"}}
      follow_redirect! # this doesn't work yet
    end
    # after category is created make sure the correct template displays and the body is correct
    assert_template "categories/index"
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_template "categories/new"
    # make sure nothing was added to the database
    assert_no_difference "Category.count" do
      post categories_path, params: {category: {name: ""}}
    end
    assert_template "categories/new"
    # make sure the alert shows if there is an error
    assert_select 'div.alert-heading'
    assert_select 'h2'
  end
end