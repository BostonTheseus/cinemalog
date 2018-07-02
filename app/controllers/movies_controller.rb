class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @movies = Movie.paginate(:page => params[:page], :per_page => 30)
    end
    
    def new
        @movie = Movie.new
    end
    
    def create
        Movie.create(movie_params)
        redirect_to root_path
    end

  private

  def movie_params
    params.require(:movie).permit(:title, :review, :rating)
  end
end
