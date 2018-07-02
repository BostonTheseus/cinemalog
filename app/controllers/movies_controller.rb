class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @movies = Movie.paginate(:page => params[:page], :per_page => 30)
    end
    
    def new
        @movie = Movie.new
    end
end
