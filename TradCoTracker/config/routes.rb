Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
  # get 'point/index'
  # get 'point/show'
  # get 'point/new'
  # get 'point/edit'
  # get 'point/delete'
>>>>>>> Stashed changes
  root 'portal#login'

  get 'portal/login'
  get 'portal/logout'
  get 'portal/view_points'
  get 'portal/add_points'
<<<<<<< Updated upstream
  get 'portal/create_user'
  get 'portal/view_members'
=======
  
  resources :point do
    member do
      get :delete
    end
  end


>>>>>>> Stashed changes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
