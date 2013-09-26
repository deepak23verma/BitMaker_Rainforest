class Product < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :users, :through => :reviews
	belongs_to :category

	has_attached_file :photoq

	validates :name, :description, presence: true
	validates :price_in_cents, :numericality => {:only_integer => true}

end