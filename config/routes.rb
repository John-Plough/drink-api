Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/drinks" => "drinks#index"
  post "/drinks" => "drinks#create"
  get "/drinks/:id" => "drinks#show"
  patch "/drinks/:id" => "drinks#update"
end
