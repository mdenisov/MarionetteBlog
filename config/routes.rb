MarionetteBlog::Application.routes.draw do
  
  scope module: 'frontend' do
    resources :posts    
    resources :tags
    resources :categories
  end

  root to: 'frontend/home#index'
end
