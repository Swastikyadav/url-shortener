Rails.application.routes.draw do
  root "links#index"
  get "/generate-report" => "reports#generate_report"
  resources :links, only: [:create, :show, :index, :update], param: :slug
end
