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
    @items = case @review.reviewable_type
      when "Company"
        policy_scope(Company)
      when "Product"
        policy_scope(Product)
      else
        []
      end
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to @review.reviewable, notice: "Review was successfully created." }
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

  def update
    authorize @review

    if @review.update(review_params)
      flash.now[:notice] = "Review was successfully updated."
      respond_to do |format|
        format.html { redirect_to @review.reviewable, notice: "Review was successfully updated." }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.turbo_stream
      end
    end
  end

  def destroy
    authorize @review
    @review.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: reviews_url, notice: "Review was successfully destroyed." }
      format.js
    end
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
