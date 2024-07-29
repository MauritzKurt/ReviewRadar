# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  body            :text
#  reviewable_type :string           not null
#  status          :boolean
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :integer
#  reviewable_id   :bigint           not null
#
# Indexes
#
#  index_reviews_on_reviewable  (reviewable_type,reviewable_id)
#
class Review < ApplicationRecord
  belongs_to :author, required: true, class_name: 'User', foreign_key: 'author_id'
  belongs_to :reviewable, polymorphic: true
  # belongs_to :product, required: true, class_name: "Product", foreign_key: "product_id"
  # belongs_to :company, required: true, class_name: "Company", foreign_key: "company_id"
end
