Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
  
  get("/", { :controller => "movies", :action => "index" })
  
  ############ Directors ###############################################################################
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

  ############ Movies ###############################################################################
  
  #create
  get("/movies/new_form", { :controller => "movies", :action => "m_new"})
  get("/movies/create", {:controller =>"movies", :action =>"m_create" })
  
  #delete
  get("/delete_movie/:movie_id",{:controller=>"movies", :action=>"m_delete"})
  
  #edit
  get("/movies/:movie_id/edit_form", {:controller =>"movies", :action => "m_edit" })
  get("/movies/update/:movie_id", {:controller => "movies", :action => "m_update"})
  
  #read
  get("/movies", { :controller => "movies", :action => "m_index" })
  get("/movies/:movie_id", { :controller => "movies", :action => "m_detail" })
  
end
