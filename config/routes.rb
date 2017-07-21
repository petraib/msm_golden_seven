Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
  
  get("/", { :controller => "movies", :action => "index" })
  
  #create
  get("/directors/new_form", { :controller => "movies", :action => "d_new" })
  get("/directors/create", { :controller => "movies", :action => "d_process_new" })

  
  #delete
  get("/delete_director/:director_id", { :controller => "movies", :action => "d_delete" })
  
  #edit
  get("/directors/:director_id/edit_form", { :controller => "movies", :action => "d_edit" })
  get("/directors/update/:director_id", { :controller => "movies", :action => "d_update" })

  #read
  get("/directors", { :controller => "movies", :action => "d_index" })
  get("/directors/:director_id", { :controller => "movies", :action => "d_detail" })

end
