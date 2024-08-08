class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = policy_scope(Product)
    authorize @products
  end

  def show
    @product = Product.find(params[:id])
    authorize @product

    @reviews = policy_scope(@product.reviews).order(created_at: :desc)
    @review = @product.reviews.build(author: current_user)
    authorize @review
  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit
    authorize @product
  end

  def create
    @review = Review.new(review_params)
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  # def create
  #   @product = Product.new(product_params)
  #   authorize @product

  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    authorize @product

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @product
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :company_id, :url)
  end
end
