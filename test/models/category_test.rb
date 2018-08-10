# frozen_string_literal: true

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # runs this setup method before every test
  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    # can we initiate a new category instance variable? checks if it is valid
    assert @cetegory.valid?
  end

  test "name should be present" do
    @category.name = " "
  end
end
