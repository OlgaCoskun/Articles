class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20, too_long: "не более %{count} символов"}

  before_save { self.email = email.downcase }
  validates :email, presence: true, length: {maximum: 30}
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

end
