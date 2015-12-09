Rails.application.routes.draw do
  
  devise_for :users
  
  get 'welcome/home'

  get 'welcome/about'

  root to: "welcome#home"
  
end
