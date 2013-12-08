class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    safe_movie = params.require(:movie).permit(:title, :description, :year_realeased, :rating)
    @movie = Movie.new safe_movie
    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def show
    @movie = Movie.find params[:id]
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    safe_movie = params.require(:movie).permit(:title, :description, :year_realeased, :rating)
    @movie.update safe_movie
    redirect_to @movie
  end
end
