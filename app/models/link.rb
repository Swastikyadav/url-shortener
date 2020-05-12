class Link < ApplicationRecord
  validates :url, presence: true
  validates :slug, presence: true, length: { is: 8 }, uniqueness: true

  def generate_slug
    SecureRandom.alphanumeric(8)
  end
end
