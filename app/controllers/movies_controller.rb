class MoviesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    
    def index
        @movies = Movie.all
        @movies = Movie.paginate(:page => params[:page], :per_page => 30)
    end
    
    def new
        @movie = Movie.new
    end
    
    def create
        current_user.movies.create(movie_params)
        redirect_to root_path
    end
    
    def show
        @movie = Movie.find(params[:id])
    end
    
    def edit
        @movie = Movie.find(params[:id])
        
        if @place.user != current_user
            return render plain: 'Not Allowed', status: :forbidden
        end
    end
    
    def update
        @movie = Movie.find(params[:id])
        
        if @place.user != current_user
            return render plain: 'Not Allowed', status: :forbidden
        end
        
        @movie.update_attributes(movie_params)
        redirect_to root_path
        

    end
    
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to root_path
    end

  private

  def movie_params
    params.require(:movie).permit(:title, :review, :rating)
  end
end
