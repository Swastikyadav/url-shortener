class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :slug, presence: true, length: { is: 8 }, uniqueness: true
  validates :pinned, inclusion: { in: [true, false] }
  validates :clicked, presence: true, numericality: { only_integer: true }

  def generate_slug
    loop do
      slug = SecureRandom.alphanumeric(8)
      self.slug = slug
      break slug unless Link.where(slug: slug).exists?
    end
  end
end
