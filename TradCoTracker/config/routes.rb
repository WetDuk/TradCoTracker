Rails.application.routes.draw do
  # get 'member_point/index'
  # get 'member_point/show'
  # get 'member_point/new'
  # get 'member_point/edit'
  # get 'member_point/delete'
  resources :member_point do
    member do
      get :delete
    end
  end

  root 'portal#login'
  get 'portal/login'
  get 'portal/logout'
  get 'portal/view_points'
  get 'portal/add_points'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
