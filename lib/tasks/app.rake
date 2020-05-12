namespace :app do
  task :encode => :environment do
    short_link = Link.shorten(ENV['URL'])
    puts "The shortened url of #{ENV['URL']} is #{short_link}"
  end

  task :decode => :environment do
    given_slug = ENV['SHORTURL'].last(8)
    link = Link.find_by(slug: given_slug)
    if !!link
      puts "The original url of short url https://short.is/#{link.slug} is #{link.url}"
    else
      puts "No original url was found for the short url https://short.is/#{given_slug}"
    end
  end
end