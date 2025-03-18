Rails.application.routes.draw do
  devise_for :users

  # Routes for Posts
  resources :posts do
    # Nested routes for Comments under Posts
    resources :comments, only: [:create, :update] do
      member do
        get 'edit_comment'
        patch 'update_comment'
      end
    end
  end

  resources :comments, only: :destroy

  resources :contact, only: [:new, :create]

  # Routes for Plants
  resources :plants do
    # Nested routes for Tips under Plant
    resources :tips, only: [:create] do
      member do
        get 'edit_tip'
        patch 'update_tip'
      end
    end
    resources :neighbours, only: [:create]
  end

  # Routes for Lists
  resources :lists do
    # Nested routes for PlantLists under Lists
    resources :plant_lists, only: [:create] do
      member do
        get 'edit_plant_list'
        patch 'update_plant_list'
      end
    end
  end

  # Routes for Tips (outside the nested context if needed)
  resources :tips, only: [:index, :show, :update, :destroy]
  # Routes for PlantLists (outside the nested context if needed)
  resources :plant_lists, only: [:index, :show, :update, :destroy]
  # Routes for Neighbours
  resources :neighbours, only: [:index, :show, :update, :destroy]

  root to: "pages#home"

  get 'a-propos', to: 'pages#about'
  # get 'contact', to: 'pages#contact'
  get 'recrutement', to: 'pages#recrutement'
  get 'calendrier', to: 'calendriers#index'
  get 'telecharger', to: 'calendriers#download'
  get 'mentions-legales', to: 'pages#mentions_legales'
  get 'plant-finder', to: 'pages#plant_finder'

end
