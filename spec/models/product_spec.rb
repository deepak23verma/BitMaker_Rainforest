require 'spec_helper'

describe Product do
	it "should have a name" do
		@product=FactoryGirl.create(:product)
		@product.name.should=="product name"
	end
end