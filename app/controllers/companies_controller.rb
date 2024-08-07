class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = policy_scope(Company)
    authorize @companies
  end

  def show
    @reviews = @company.reviews
    authorize @company
    authorize @reviews
  end

  def new
    @company = Company.new
    authorize @company
  end

  def edit
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
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
