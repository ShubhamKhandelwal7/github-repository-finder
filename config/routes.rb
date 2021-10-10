Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :github_finder, only: :index do
    collection do
      post :check_repo
    end
  end
end
