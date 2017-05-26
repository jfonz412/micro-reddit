class User < ApplicationRecord
	has_many :posts
	validates :name, presence: true, uniqueness: true,
						length: { maximum: 25, minimum: 3 }
end
