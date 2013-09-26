class ReviewsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
  before_filter :load_product
  
  def show
  	@review = Review.find(params[:id])
  end

  # def new
  # end

  def create 
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id
    respond_to do |format|
    	if @review.save
        format.html {redirect_to @product, notice: 'Review created successfully'}
    	  format.js {}    
      else 
        format.html {render "products/show" }
        format.js {}
    	end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy

    redirect_to @product, notice: 'Review successfully deleted'
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end

  def review_params
  	params.require(:review).permit(:comment, :user_id, :product_id)
  end
end
