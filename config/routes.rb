Rails.application.routes.draw do
  root to: "home#index"
  post "/links", to: "links#create"
  get "/links", to: "links#index"
  get '/reveal/:id', to: "links#reveal", as: :reveal
  get '/hide/:id', to: "links#hide", as: :hide
  get "/s/:short_url", to: "links#show"
end
