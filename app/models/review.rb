# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  body            :text             not null
#  pending         :boolean          default(FALSE), not null
#  reviewable_type :string           not null
#  status          :boolean          default(FALSE), not null
#  title           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :integer          not null
#  reviewable_id   :bigint           not null
#
# Indexes
#
#  index_reviews_on_reviewable  (reviewable_type,reviewable_id)
#
class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', required: true
  belongs_to :reviewable, polymorphic: true

  validates :title, presence: true
  validates :body, presence: true
  validates :author_id, presence: true
  validates :reviewable_id, presence: true
  validates :pending, inclusion: { in: [true, false] }
  validates :status, inclusion: { in: [true, false] }

  validate :pending_and_verified_cannot_be_true_at_the_same_time

  private

  def pending_and_verified_cannot_be_true_at_the_same_time
    if pending && status
      errors.add(:pending, 'cannot be true if the review is verified')
      errors.add(:status, 'cannot be true if the review is pending')
    end
  end
end
