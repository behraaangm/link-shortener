Rails.application.routes.draw do
  root to: "home#index"
  post "/links", to: "links#create"
end
