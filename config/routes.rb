Rails.application.routes.draw do
  get 'api/v1/search', to: 'api/v1/repositories_search#index'
end
