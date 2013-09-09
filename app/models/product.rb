class Product < ActiveRecord::Base

	validates :name, :description, presence: true
	validates :price_to_cents, :numericality => {:only_integer => true}

end
