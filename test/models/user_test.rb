require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
    @user = User.new(name: "Mr. Foo")
	end

	test "user should be valid" do
		assert(@user.valid?)
	end

	test "user.name should be present (not blank)" do
		@user.name = "		"
		assert_not(@user.valid?)
	end

	test "user's name should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not(duplicate_user.valid?)
	end

	test "user's name can't be too short (less than 3 chars)" do
		@user.name = "XY"
		assert_not(@user.valid?)
	end

	test "user's name can't be too long (max 25 chars)" do
		@user.name = "x" * 26
		assert_not(@user.valid?)
	end
end
