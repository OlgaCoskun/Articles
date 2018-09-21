class Category < ApplicationRecord
  belongs_to :post

  validates :topic, presence: true, length: {maximum: 20}
  validates :email, format: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
end
