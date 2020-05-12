Rails.application.routes.draw do
  get "/links/:slug" => "links#show"
  post "/links" => "links#create"
end
