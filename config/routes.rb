Rails.application.routes.draw do
  root 'kits#index', as: 'kits'
  get 'kits/:id' => 'kits#show', as: 'kit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
