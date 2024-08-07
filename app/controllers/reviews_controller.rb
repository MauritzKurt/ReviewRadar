class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @reviews = policy_scope(Review)
    authorize @reviews
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    @items = policy_scope(Company)
    authorize @review
  end

  def edit
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review

    if @review.save
      redirect_to review_url(@review), notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @review

    if @review.update(review_params)
      redirect_to review_url(@review), notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to reviews_url, notice: "Review was successfully destroyed."
  end

  def get_items
    type = params[:type]

    @items = case type
      when "Company"
        policy_scope(Company)
      when "Product"
        policy_scope(Product)
      else
        []
      end

    authorize @items.first, :index? if @items.any?

    render json: @items.map { |item| { id: item.id, name: item.name } }
  rescue Pundit::NotAuthorizedError => e
    Rails.logger.error("Pundit authorization error: #{e.message}")
    render json: { error: "Not authorized" }, status: :forbidden
  rescue StandardError => e
    Rails.logger.error("Error fetching items: #{e.message}")
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:author_id, :reviewable_type, :reviewable_id, :title, :body, :status)
  end
end
