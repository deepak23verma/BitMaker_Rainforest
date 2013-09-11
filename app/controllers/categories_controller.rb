class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	# do stuff
  end
end
