Rails.application.routes.draw do
  
  get 'capm/index'

  get 'capm/capm_graph'

  devise_for :users
  
  get 'welcome/home'
  get 'welcome/features'
  get 'welcome/about'
  get 'welcome/beta'
  get 'welcome/learn'

  root to: "welcome#home"
  
end
