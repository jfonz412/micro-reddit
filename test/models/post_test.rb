require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		User.create(name: "Mr. Foo")
		@post = User.first.posts.build(title: "Foo Bar", link: "www.foobar.com")
	end

	test "post is valid" do
		assert(@post.valid?)
	end

	test "post title cannot be blank" do
		@post.title = "			"
		assert_not(@post.valid?)
	end

	test "post link cannot be blank" do
		@post.link = "			"
		assert_not(@post.valid?)
	end

	test "post title cannot be less than 3 chars" do
		@post.title = "xy"
		assert_not(@post.valid?)
	end

	test "post title cannot be more than 255 chars" do
		@post.title = "x" * 256
		assert_not(@post.valid?)
	end

	test "link cannot be more than 255 chars" do
		@post.link = "x" * 256
		assert_not(@post.valid?)
	end

	test "should accept valid links" do
		valid_urls = %w[www.foobar.com https://foobar.com www.foo-bar.com https://www.foobar.gov]
		valid_urls.each do |valid_url|
			@post.link = valid_url
			assert(@post.valid?, "#{valid_url.inspect} should be valid")
		end
	end

	test "link must be a valid URL" do
		invalid_urls = %w[foobar f.o.o.b.a.r.com https//foobar.com wwwfoobarcom]
		invalid_urls.each do |invalid_url|
			@post.link = invalid_url
			assert_not(@post.valid?, "#{invalid_url.inspect} should be invalid")
		end
	end
end
