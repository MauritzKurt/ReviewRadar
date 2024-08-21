class ScrapesController < ApplicationController
  before_action :authorize_scrape, only: :show

  def show
    scraper_class = determine_scraper(params[:source])

    if scraper_class
      scraper = scraper_class.new(params[:url])
      @scraped_data = scraper.scrape_reviews
      @scraped_data ||= []

      @extracted_domain = extract_domain_from_url(params[:url])

      respond_to do |format|
        format.html
        format.json { render json: @scraped_data }
      end
    else
      redirect_to root_path, alert: "Unsupported source or incorrect URL."
    end
  end

  private

  def determine_scraper(source)
    case source.downcase
    when "trustpilot"
      TrustpilotScraper
    when "google"
      GoogleReviewsScraper
    else
      nil
    end
  end

  def authorize_scrape
    authorize :scrape
  end

  def extract_domain_from_url(url)
    domain = URI.parse(url).host
    domain_parts = domain.split(".")
    domain = domain_parts[-2] if domain_parts.size >= 2
    domain
  end
end
