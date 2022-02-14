class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :body, presence: true, length: { minimum: 30, maximum: 1500 }
end
