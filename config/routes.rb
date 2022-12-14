Rails.application.routes.draw do  



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
    end
    
    resources :comments do
      collection do
        post 'confirm'
      end
      member do
        post 'dummy2'
      end  
    end
  end

  resource :answer, controller: 'answer', only: [:new, :create, :destroy] do
    collection do
      post 'answer_confirm'
    end

    resources :likes, only: [:create, :destroy]
  end

  get root 'home#top'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
