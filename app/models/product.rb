class Product < ActiveRecord::Base
	has_many :reviews
	has_many :users, :through => :reviews

	validates :name, :description, presence: true
	validates :price_in_cents, :numericality => {:only_integer => true}

end
