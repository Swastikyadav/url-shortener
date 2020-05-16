Rails.application.routes.draw do
  get "/links", to: "links#index"
  resources :links, only: [:create, :show], param: :slug
end
