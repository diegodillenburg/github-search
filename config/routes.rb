Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  get 'api/v1/search', to: 'api/v1/repositories_search#index'
end
