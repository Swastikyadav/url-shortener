urls = [
  "https://swastikyadav.com/learn",
  "https://twitter.com/codeSwastik",
  "https://learnrubyonrails.bigbinary.com",
  "https://altcampus.io/batches/9/students",
  "https://freecodecamp.com/learn/courses",
  "https://hashnode.com/post/seeding-your-db",
  "https://github.com/Swastikyadav/url-shortener",
  "https://web.whatsapp.com/profile",
  "https://andromeda.com/secret-galaxy",
  "https://canva.com/profile/your-designs"
]

def generate_slug
  loop do
    slug = SecureRandom.alphanumeric(8)
    break slug unless Link.where(slug: slug).exists?
  end
end

Link.destroy_all

urls.each do |url|
  Link.create(url: url, slug: generate_slug)
end
