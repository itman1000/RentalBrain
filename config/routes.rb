Rails.application.routes.draw do  

  get root 'home#top'

  resources  :users, :posts

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

  resources :posts do
    collection do
      post 'confirm'
    end
    member do
      post 'dummy'
      patch 'edit_confirm'
      post 'commit'
      get 'answer'
      post 'answer_confirm'
      post 'answer_create'
      delete 'answer_delete'
    end
  end

  post 'likes/:post_id/create', to: 'likes#create'
  post 'likes/:post_id/destroy', to: 'likes#destroy'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
