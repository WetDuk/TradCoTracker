# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  root 'portal#login'
  get 'portal/logout'
  get 'portal/view_points'
  get 'portal/add_points'
  get 'portal/view_members'
  get 'portal/home'

  resources :points do
    member do
      get :delete_show
      get :delete_index
      get :edit_show
      get :edit_index
      post :update_index
      get :destroy_user
    end
  end

  resources :searches


  resources :users do
    member do
      get :delete
    end
  end


  get '/login', to: 'portal#login'
  post '/login', to: 'portal#create'
  get '/logout', to: 'portal#destroy'
  post '/logout', to: 'portal#destroy'

  # get 'points/index'
  # get 'points/show'
  # get 'points/new'
  # get 'points/edit'
  # get 'points/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "*path", to: redirect('/')
end
