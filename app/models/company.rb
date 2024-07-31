# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  description :text
#  logo_image  :string           default("logo_placeholder.png")
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  has_many :products, class_name: 'Product', foreign_key: 'company_id', dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[products]
  end
end
