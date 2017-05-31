class Comment < ApplicationRecord
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :body, presence: true

  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

end
