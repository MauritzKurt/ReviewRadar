# app/services/trustpilot_scraper.rb
require "nokogiri"
require "open-uri"

class TrustpilotScraper
  def initialize(url)
    @url = url
  end

  def scrape_reviews
    html = URI.open(@url)
    doc = Nokogiri::HTML(html)

    reviews = []

    # Loop through each review card
    doc.css(".styles_cardWrapper__LcCPA").each do |review_card|
      puts review_card.to_html

      # Extract and clean reviewer name
      reviewer_name = safe_text(review_card.at_css(".styles_consumerDetails__ZFieb span"))
      reviewer_name = reviewer_name.gsub(" from", "")

      rating = extract_rating(review_card.at_css(".star-rating_starRating__4rrcf img")["alt"])

      review_title = review_card.at_css('a[data-review-title-typography="true"] h2')&.text&.strip
      review_body = review_card.at_css('p[data-service-review-text-typography="true"]')&.text&.strip
      
      date_of_experience = safe_text(review_card.at_css('[data-service-review-date-of-experience-typography="true"]'))
      date_of_experience = date_of_experience.gsub("Date of experience: ", "")

      reviews << {
        title: review_title,
        body: review_body,
        rating: rating,
        reviewable_type: "Company",
        reviewable_id: find_company_id_by_name(@extracted_domain),
        source: "TrustPilot",
        pending: false,
        status: false,
        reviewer_name: reviewer_name,
        date_of_experience: date_of_experience,
      }
    end

    reviews
  end

  private

  def extract_rating(rating_text)
    case rating_text
    when /1/ then 1
    when /2/ then 2
    when /3/ then 3
    when /4/ then 4
    when /5/ then 5
    else 3
    end
  end

  def safe_text(element)
    element&.text&.strip || "N/A"
  end

  def find_company_id_by_name(company_name)
    Company.where("name ILIKE ?", "%#{company_name}%").pluck(:id).first
  end
end
