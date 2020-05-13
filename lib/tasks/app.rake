namespace :app do
  session = ActionDispatch::Integration::Session.new(Rails.application)
  routes = Rails.application.routes.url_helpers

  task :encode => :environment do
    request_link = routes.links_url(:host => "http://localhost:3000")

    session.post request_link, params: { "link": { "url": ENV['URL'] } }
    response = JSON.parse(session.response.body)

    if response["success"]
      puts "The shortened url of #{ENV['URL']} is https://short.is/#{response['slug']}"
    end
  end

  task :decode => :environment do
    request_link = routes.links_url(:host => "http://localhost:3000")
    
    given_slug = ENV['SHORTURL'].split('/').last

    session.get "#{request_link}/#{given_slug}"
    response = JSON.parse(session.response.body)

    if response["success"]
      puts "The original url of short url https://short.is/#{given_slug} is #{response['original_url']}"
    else
      puts "No original url was found for the short url https://short.is/#{given_slug}"
    end
  end
end