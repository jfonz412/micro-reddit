class Post < ApplicationRecord
	
	has_many :comments
	belongs_to :user # generated via migration, but this line was manually added

	validates :title, presence: true, length: { minimum: 3, maximum: 255 }
	# URL Regex will not accept "shortened" links like foobar.com, must be www.foobar.com
	VALID_URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/
	validates :link, presence: true, length: { maximum: 255 },
						format: { with: VALID_URL_REGEX }
end
