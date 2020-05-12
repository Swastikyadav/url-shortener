namespace :app do
  task :encode => :environment do
    include Rails.application.routes.url_helpers
    request_link = links_url(:host => "http://localhost:3000")

    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.post request_link, params: { "link": { "url": ENV['URL'] } }
    response = JSON.parse(session.response.body)

    if response["success"]
      puts "The shortened url of #{ENV['URL']} is https://short.is/#{response['slug']}"
    end
  end

  task :decode => :environment do
    include Rails.application.routes.url_helpers
    request_link = links_url(:host => "http://localhost:3000")
    
    given_slug = ENV['SHORTURL'].last(8)

    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get "#{request_link}/#{given_slug}"
    response = JSON.parse(session.response.body)

    if response["success"]
      puts "The original url of short url https://short.is/#{given_slug} is #{response['original_url']}"
    else
      puts "No original url was found for the short url https://short.is/#{given_slug}"
    end
  end
end