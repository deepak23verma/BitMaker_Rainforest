class CategoriesController < ApplicationController
	before_filter :ensure_logged_in, :only => [:show]
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end
end
