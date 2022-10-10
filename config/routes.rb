Rails.application.routes.draw do  

  resources :posts do
    collection do
      post 'confirm'
    end
    member do
      patch 'edit_confirm'
    end
  end

  resources :users do
    member do
      get 'confirm'
      patch 'confirmed'
    end
  end

  resources :posts, :users


  get '/' => 'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
