class Post < ApplicationRecord
  # belongs_to :user
  has_one :category
  accepts_nested_attributes_for(:category, update_only: true)

  has_many :comments, dependent: :destroy

  # validates :user, presence: true
  validates :title, presence: true, length: {maximum: 255}
  validates :body, presence: true
  validates :category, presence: true

end
