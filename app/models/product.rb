# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  logo_image  :string           default("logo_placeholder.png")
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#
class Product < ApplicationRecord
  belongs_to :company, required: true, class_name: 'Company', foreign_key: 'company_id'
  has_many :reviews, as: :reviewable, dependent: :destroy
end

