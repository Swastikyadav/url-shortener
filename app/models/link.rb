class Link < ApplicationRecord
  validates :url, presence: true
  validates :slug, presence: true, length: { is: 8 }, uniqueness: true
end
