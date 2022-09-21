Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api/docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/:key', to: 'resolved_urls#show'
  post '/api/v1/shortened_urls', to: 'api/v1/shortened_urls#create'
end
