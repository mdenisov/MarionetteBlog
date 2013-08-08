MarionetteBlog::Application.routes.draw do
  
  scope module: 'frontend' do
    resources :posts do
      resources :comments
    end
    resources :tags
    resources :categories
  end

  root to: 'frontend/home#index'
end
