Rails.application.routes.draw do
  get 'api/v1/search', to: 'repositories_search#index'
end
