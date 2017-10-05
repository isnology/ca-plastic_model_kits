Rails.application.routes.draw do
  root 'kits#index'
  get 'kits/:id' => 'kits#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
