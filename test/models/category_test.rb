# frozen_string_literal: true

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # runs this setup method before every test
  def setup
    @category = Category.new(name: "sports")
  end

  # can we initiate a new category instance variable? checks if it is valid
  test "category should be valid" do
    assert @category.valid?
  end

  # if this returns true the test will fail
  # if the name is an empty string it will fail the test
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end


  # we should not be able to create a new category that already exists
  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert_not @category2.valid?
  end
end
