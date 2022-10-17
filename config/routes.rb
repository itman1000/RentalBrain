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
    collection do
      get 'login_form'
      post 'login'
      get 'logout'
    end
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
