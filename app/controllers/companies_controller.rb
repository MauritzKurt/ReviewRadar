class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = policy_scope(Company)
    authorize @companies
  end

  def show
    @company = Company.find(params[:id])
    authorize @company

    @reviews = policy_scope(@company.reviews).order(created_at: :desc)
    @review = @company.reviews.build(author: current_user) # Initialize a new review for the form
    authorize @review
  end

  def new
    @company = Company.new
    authorize @company
  end

  def edit
    authorize @company
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

  def update
    authorize @company

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @company
    @company.destroy
    
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :logo_image, :url, :description)
  end
end
