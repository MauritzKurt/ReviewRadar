class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = policy_scope(Review)
    authorize @reviews
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def edit
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review

    if @review.save
      redirect_to review_url(@review), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @review

    if @review.update(review_params)
      redirect_to review_url(@review), notice: 'Review was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:author_id, :product_id, :title, :body, :status)
  end
end
