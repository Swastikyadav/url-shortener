class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :slug, presence: true, length: { is: 8 }, uniqueness: true

  def generate_slug
    SecureRandom.alphanumeric(8)
  end

  def self.shorten(url)
    # If url already exists, return shortened url
    link = Link.where(url: url).first
    return "https://short.is/#{link.slug}" if link

    # Create a new
    link = Link.new(url: url, slug: SecureRandom.alphanumeric(8))
    return "https://short.is/#{link.slug}" if link.save

    # If slug is taken, generate again.
    Link.shorten(url)
  end
end
