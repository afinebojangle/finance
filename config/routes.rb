Rails.application.routes.draw do
  
  devise_for :users
  
  get 'welcome/home'
  get 'welcome/features'
  get 'welcome/about'
  get 'welcome/beta'
  get 'welcome/learn'

  root to: "welcome#home"
  
end
