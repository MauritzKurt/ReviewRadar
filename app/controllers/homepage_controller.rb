class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @q = params[:q]
    if @q.present?
      @products = Product.ransack(name_cont: @q).result.includes(:company)
      @companies = Company.ransack(name_cont: @q).result
    else
      @products = Product.includes(:company).all
      @companies = Company.all
    end

    authorize @products
    authorize @companies
  end
  
  def home
    authorize :homepage, :home?
    render "homepage/show"
  end
end
