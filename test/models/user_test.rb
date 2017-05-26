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

end
