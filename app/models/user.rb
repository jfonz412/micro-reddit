class User < ApplicationRecord
	has_many :posts #manually added, no migration needed
	validates :name, presence: true, uniqueness: true,
						length: { maximum: 25, minimum: 3 }
end
