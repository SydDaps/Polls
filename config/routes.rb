Rails.application.routes.draw do
  
  
 
  get 'votes/index'
  get 'votes/new'
  get 'welcome/index' => 'welcome#index'

  delete "/session", to: "sessions#destroy"
  
  resources :organizers , only: [:new, :create]
  resources :polls , only: [:index, :new, :create, :show, :update]
  resources :sessions , only: [:new, :create]
  resources :sections , only: [:create]
  resources :polls do 
    resources :voters, only: [:create, :show]
  end

  resources :voters, only: [:show] do 
    resources :votes, only: [:new, :create]
  end

  resources :polls do 
    resources :votes, only: [:index]
  end

  
  

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
