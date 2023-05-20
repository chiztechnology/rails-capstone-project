Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #  root "users#index"
  root "recipes#my_recipes"
  get 'public-recipes', to: 'recipes#public_recipes'
  get 'my-recipes', to: 'recipes#my_recipes'
  get 'my-foods', to: 'foods#my_foods'
  put '/recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'toggle_public_recipe'
  get '/recipes/:id/shopping_list', to: 'recipes#shopping_list', as: 'recipe_shopping_list'


  resources :recipes do
    resources :recipe_foods
  end  
  resources :foods
end
