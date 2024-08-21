class TrustpilotScraper
  require "public_suffix"

  def initialize(url)
    @url = url
    @extracted_domain = extract_domain_from_url(url)
  end

  def scrape_reviews
    html = URI.open(@url)
    doc = Nokogiri::HTML(html)

    reviews = []

    doc.css(".styles_cardWrapper__LcCPA").each do |review_card|
      reviewer_name = safe_text(review_card.at_css(".styles_consumerDetails__ZFieb span")).gsub(" from", "")
      rating = extract_rating(review_card.at_css(".star-rating_starRating__4rrcf img")["alt"])
      review_title = safe_text(review_card.at_css('a[data-review-title-typography="true"] h2'))
      review_body = safe_text(review_card.at_css('p[data-service-review-text-typography="true"]'))
      date_of_experience = safe_text(review_card.at_css('[data-service-review-date-of-experience-typography="true"]')).gsub("Date of experience: ", "")
      reviewable_id = find_company_id_by_name(@extracted_domain)

      Review.create(
        title: review_title,
        body: review_body,
        rating: rating,
        reviewable_type: "Company",
        reviewable_id: reviewable_id,
        source: "TrustPilot",
        pending: false,
        status: false,
        author_id: nil,
        created_at: date_of_experience,
      )

      reviews << {
        title: review_title,
        body: review_body,
        rating: rating,
        reviewable_type: "Company",
        reviewable_id: reviewable_id,
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
    rating_text.match(/\d+/).to_s.to_i
  end

  def safe_text(element)
    element&.text&.strip || "N/A"
  end

  def find_company_id_by_name(company_name)
    Company.where("name ILIKE ?", "%#{company_name}%").pluck(:id).first
  end

  def extract_domain_from_url(url)
    uri = URI.parse(url)

    if uri.host.include?("trustpilot.com") && uri.path.include?("review")
      company_segment = uri.path.split("/").last

      return company_segment.gsub(/^www\./, "").split(".").first
    end

    uri.host.split(".").second || uri.host.split(".").first
  end
end
