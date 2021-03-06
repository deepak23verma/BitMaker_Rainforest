class ProductsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]
  respond_to :html, :json
  
  # GET /products
  # GET /products.json
  def index
  	@products = Product.all
    respond_with @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
    respond_with @product
  end

  # GET /products/new
  # GET /products/new.json
  def new
  	# @product = @category.products.new
    @product = Product.new
    respond_with @product
  end

  # POST /products
  # POST /products.json
  def create
  	@product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "#{@product.name} was successfully created." }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_path(@product),  notice: "#{@product.name} was successfully updated." }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity } 
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy

    respond_to do |format| 
      format.html { redirect_to products_url, notice: "Product successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents, :category_id)
  end

end
