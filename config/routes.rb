Rails.application.routes.draw do
  root to: "home#index"
  post "/links", to: "links#create"
  get "/s/:short_url", to: "links#show"
end
