class MoviesController < ApplicationController
 
  def index
      
       render("msm_templates/directors.html.erb") 
  end

  def d_index
     @all_directors = Director.all.order(:created_at => :desc)
       render("msm_templates/directors.html.erb") 
  end
  
   def d_new
      
   render("msm_templates/directors_new.html.erb") 

  end
  
  def d_process_new
      
     d=Director.new()
     d.name = params[:name]
     d.bio = params[:bio]
     d.dob =  params[:dob]
     d.image_url =  params[:image_url]

     d.save
     
    @dir_id = d[:id]
   render("msm_templates/directors_detail.html.erb") 

  end
  
  def d_detail
      
      @dir_id = params[:director_id]
      render("msm_templates/directors_detail.html.erb") 
  end
  
   def d_delete
      
      @dir_id = params[:director_id]
      Director.destroy(@dir_id)
      redirect_to("msm_templates/directors.html.erb") 
  end
  
end