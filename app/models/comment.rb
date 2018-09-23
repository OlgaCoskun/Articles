class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  validates :post, presence: true
  validates :com_body, presence: true
end
