Rails.application.routes.draw do
  get '/search', to: 'repositories_search#index'
end
