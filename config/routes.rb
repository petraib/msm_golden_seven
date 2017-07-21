Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
  
  get("/", { :controller => "movies", :action => "index" })
  
  #read
  get("/directors", { :controller => "movies", :action => "d_index" })
  get("/directors/:director_id", { :controller => "movies", :action => "d_detail" })

  
end
