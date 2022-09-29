Rails.application.routes.draw do
  get 'posts/new' => 'posts#new'
  get 'posts/index' => 'posts#index'
  get 'posts/:id' => 'posts#show'

  post 'posts' => 'posts#create'

  get '/' => 'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
