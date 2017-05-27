require 'test_helper'

class CommentTest < ActiveSupport::TestCase

	def setup
		User.create(name: "Mr. Foo")
		User.first.posts.build(title: "Foo Bar", link: "www.foobar.com")
		@comment = Comment.new(text:"This is the first ever micro-reddit comment.")
	end

	test "should be valid" do
		assert(@comment.valid?)
	end

	test "comment cannot be blank" do
		@comment.text = "			"
		assert_not(@comment.valid?)
	end

	test "comments cannot be longer than 10,000 chars" do
		@comment.text = "x" * 10001
		assert_not(@comment.valid?)
	end
end
