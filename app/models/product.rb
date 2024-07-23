# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#
class Product < ApplicationRecord
end
