class Category < ApplicationRecord
  belongs_to :post

  validates :topic, presence: true, length: {maximum: 40}
end
