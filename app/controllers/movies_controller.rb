class MoviesController < ApplicationController
	before_action :set_movie, only: [:show, :edit, :update, :destroy]
	
	def index
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
		redirect_to @movie
    end

  	def show
    	
    end

    def update
    	respond_to do |format|
      		if @movie.update(movie_params)
        		format.html { redirect_to @movie, notice: 'movie was successfully updated.' }
        		format.json { render :show, status: :ok, location: @movie }
      		else
       			format.html { render :edit }
        		format.json { render json: @movie.errors, status: :unprocessable_entity }
      		end
    	end
    end

    def destroy
    end

    private
    def set_movie
    	@movie = Movie.find(params[:id])
    end

    def movie_params
    	params.require(:movie).permit(:title, :storyline, :country)
	end			 		

end
