require "test_helper"

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do
        assert @category.valid? # assert is true if the category is valid
    end

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid? # assert_not is the opposite of assert (assert_not is false)
    end

    test "name should be unique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "name should not be too long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
    
end

# To run the test file in the terminal:
# $ rails test
#
# To run a specific test file in the terminal:
# $ rails test test/models/category_test.rb

# To run a specific test in the terminal:
# $ rails test test/models/category_test.rb:6
# This will run the test on line 6 of the file.

# How to generate unit test for a resource:
# $
# $ rails generate test_unit:scaffold Article
# rails generate test_unit:scaffold category

# How to generate a unit test for a model:
# $ rails generate test_unit:model Article
# rails generate test_unit:model category

# How to generate a unit test for a controller:
# $ rails generate test_unit:controller Articles
# rails generate test_unit:controller categories

# How to generate a unit test for a controller action:
# $ rails generate test_unit:controller Articles index
# rails generate test_unit:controller categories index

# How to generate the integration test for a resource:
# rails generate integration_test articles
