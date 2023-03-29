require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "should save category with valid attributes" do
      user = User.create(username: "test", password: "password")
      category = Category.new(name: "Test Category", user: user)
      assert category.save
    end
end