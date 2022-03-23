require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @mCategory = Category.new(name: "Sports")
  end

  test "category should be valid" do
    assert @mCategory.valid?
  end

  test "name should be present" do
    @mCategory.name = " "
    assert_not @mCategory.valid?
  end

  test "name should be unique" do
    @mCategory.save
    @mTest = Category.new(name: "Sports")
    assert_not @mTest.valid?
  end

  test "name should not be too long" do
    @mCategory.name = "This name has too many (38) characters"
    assert_not @mCategory.valid?
  end

  test "name should not be too short" do
    @mCategory.name = "No"
    assert_not @mCategory.valid?
  end
end
