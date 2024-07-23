json.extract! product, :id, :name, :description, :company_id, :url, :created_at, :updated_at
json.url product_url(product, format: :json)
