class MoviesController < ApplicationController
 
  def index
      
       render("msm_templates/directors.html.erb") 
  end

  def d_index
      
       render("msm_templates/directors.html.erb") 
  end
  
  def d_detail
      
      @dir_id = params[:director_id]
    
      
      render("msm_templates/directors_detail.html.erb") 
  end
end