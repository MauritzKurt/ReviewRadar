# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  logo_image  :string           default("logo_placeholder.png")
#  name        :string           not null
#  url         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer          not null
#
class Product < ApplicationRecord
  belongs_to :company, required: true, class_name: 'Company', foreign_key: 'company_id'
  has_many :reviews, as: :reviewable, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :url, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[company]
  end
end
