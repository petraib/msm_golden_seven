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
   #render("msm_templates/directors_detail.html.erb") 
    redirect_to("/directors")
  end
  
  def d_detail
      
      @dir_id = params[:director_id]
      render("msm_templates/directors_detail.html.erb") 
  end
  
   def d_delete
      
      @dir_id = params[:director_id]
      Director.destroy(@dir_id)
      redirect_to("/directors") 
  end
  
   def d_edit
      
      @dir_id = params[:director_id]
      render("msm_templates/directors_edit.html.erb") 
  end
  
   def d_update
      
      d = Director.find(params[:director_id])
      d.name = params[:name]
      d.dob = params[:dob]
      d.image_url = params[:image_url]
      d.bio = params[:bio]

      d.save
      
      redirect_to("/directors/" +  params[:director_id]) 
  end
  
  ############################ movies ################################
  
  def m_index
     @all_movies = Movie.all.order(:created_at => :desc) 
      render("msm_templates/movies.html.erb")
  end
  
  def m_detail
     @m_id = params[:movie_id] 
     render("msm_templates/movies_detail.html.erb")
     
  end
  
   def m_new
      render("msm_templates/movies_new.html.erb")
  end
  
   def m_create
        
    m = Movie.new()
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.image_url = params[:image_url]
    m.description = params[:description]
    
    m.save
    
    redirect_to("/movies")
  end
  
  def m_delete
        @m_id = params[:movie_id] 
        Movie.destroy(@m_id)
        redirect_to("/movies")
  end
  
  def m_edit
      @m_id = params[:movie_id] 

      render ("msm_templates/movies_edit.html.erb")
  end
  
  def m_update
      @m_id = params[:movie_id] 
    m = Movie.find(@m_id)
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]

    m.save
    
    redirect_to("/movies/"+@m_id)
  end
  
  ################################################# actors #########################################
  
  def a_index
      
      @all_actors = Actor.all.order(:created_at => :desc)
      render("msm_templates/actors.html.erb")
  end
  
  def a_detail
      
      @a_id = params[:actor_id]
      render("msm_templates/actors_detail.html.erb")
  end
  
  def a_new
      render("msm_templates/actors_new.html.erb")
  end
  
  def a_create
      a= Actor.new()
      a.name = params[:name]
      a.dob = params[:dob]
      a.bio = params[:bio]
      a.image_url = params[:image_url]
      
      a.save
      
        @a_id = a.id
    redirect_to("/actors")
  end
  
  def a_delete
     @a_id = params[:actor_id]
     
     Actor.destroy(@a_id)
     
     redirect_to("/actors")
  end
  
  def a_edit
      @a_id = params[:actor_id]
      render ("msm_templates/actors_edit.html.erb")
  end
  
  def a_update
      @a_id = params[:actor_id]
      
      a = Actor.find(@a_id)
      a.name = params[:name]
      a.dob = params[:dob]
      a.bio = params[:bio]
      a.image_url = params[:image_url]
      
      a.save

    redirect_to("/actors/" + @a_id )
  end
  
end