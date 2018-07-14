class MoviesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @movies = Movie.all
        @movies = Movie.paginate(:page => params[:page], :per_page => 30)
    end
    
    def new
        @movie = Movie.new
    end
    
    def create
        @movie = current_user.movies.create(movie_params)
        if @movie.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entry
        end
    end
    
    def show
        @movie = Movie.find(params[:id])
    end
    
    def edit
        @movie = Movie.find(params[:id])
        
        if @movie.user != current_user
            return render plain: 'Not Allowed', status: :forbidden
        end
    end
    
    def update
        @movie = Movie.find(params[:id])
        
        if @movie.user != current_user
            return render plain: 'Not Allowed', status: :forbidden
        end
        
        @movie.update_attributes(movie_params)
        if @move.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entry
        end
        
    end
    
    def destroy
        @movie = Movie.find(params[:id])
        
        if @movie.user != current_user
            return render plain: 'Not Allowed', status: :forbidden
        end
        
        @movie.destroy
        redirect_to root_path
    end

  private

  def movie_params
    params.require(:movie).permit(:title, :review, :rating)
  end
end
