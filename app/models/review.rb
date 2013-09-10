class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates :comment, length: { minimum: 25 }
end
