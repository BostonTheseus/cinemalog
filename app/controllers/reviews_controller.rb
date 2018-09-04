class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.reviews.create(review_params.merge(user: current_user))
    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:message, :rating)
  end
end