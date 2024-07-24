json.extract! review, :id, :author_id, :product_id, :title, :body, :status, :created_at, :updated_at
json.url review_url(review, format: :json)
