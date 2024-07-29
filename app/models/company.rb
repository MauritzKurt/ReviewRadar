# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  logo_image :string           default("logo_placeholder.png")
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  has_many  :products, class_name: 'Product', foreign_key: 'company_id', dependent: :destroy

  has_many  :reviews, class_name: 'Review', foreign_key: 'company_id', dependent: :destroy, as: :reviewable
end
