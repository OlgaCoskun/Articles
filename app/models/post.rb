class Post < ApplicationRecord
  # belongs_to :user
  has_one :category

  has_many :comments, dependent: :destroy

  # validates :user, presence: true
  validates :title, presence: true, length: {maximum: 255}
  validates :body, presence: true

end
