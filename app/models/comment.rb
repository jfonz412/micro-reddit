class Comment < ApplicationRecord
	validates :text, presence: true, length: { maximum: 10000 }
end
