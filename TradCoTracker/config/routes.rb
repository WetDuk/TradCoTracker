Rails.application.routes.draw do

  root 'portal#login'

  get 'portal/login'
  get 'portal/logout'
  get 'portal/view_points'
  get 'portal/add_points'
  get 'portal/create_user'
  get 'portal/view_members'
  
  resources :point do
    member do
      get :delete
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
