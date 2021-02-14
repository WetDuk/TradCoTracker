Rails.application.routes.draw do
  root 'portal#login'

  get 'portal/login'
  get 'portal/logout'
  get 'portal/view_points'
  get 'portal/add_points'
  get 'speaking_point/index'
  get 'speaking_point/show'
  get 'speaking_point/new'
  get 'speaking_point/edit'
  get 'speaking_point/delete'
  root 'portal#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
