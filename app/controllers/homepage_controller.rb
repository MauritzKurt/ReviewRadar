class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
  
  end
  
  def home
    authorize :homepage, :home?
    render "homepage/show"
  end
end
