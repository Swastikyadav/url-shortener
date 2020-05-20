namespace :app do
  routes = Rails.application.routes.url_helpers
  session = ActionDispatch::Integration::Session.new(Rails.application)

  task :encode => :environment do
    request_link = routes.links_url(:host => "http://localhost:3000")

    session.get request_link
    p csrf_token = session.session[:_csrf_token]

    status_code = session.post request_link, params: { "authenticity_token": csrf_token, "link": { "url": ENV['URL'] } }
    response = JSON.parse(session.response.body)

    if status_code == 200
      puts "The shortened url of #{ENV['URL']} is https://short.is/#{response['slug']}"
    end
  end

  task :decode => :environment do
    given_slug = ENV['SHORTURL'].split('/').last

    status_code = session.get "http://localhost:3000#{routes.link_path(given_slug)}.json"
    response = JSON.parse(session.response.body)

    if status_code == 200
      puts "The original url of short url https://short.is/#{given_slug} is #{response['original_url']}"
    else
      puts "No original url was found for the short url https://short.is/#{given_slug}"
    end
  end
end