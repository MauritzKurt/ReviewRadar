# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#
class Product < ApplicationRecord
  belongs_to :company, required: true, class_name: "Company", foreign_key: "company_id"
  has_many  :reviews, class_name: "Review", foreign_key: "product_id", dependent: :destroy
end
