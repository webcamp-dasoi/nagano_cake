class Owner::GenresController < ApplicationController

	before_action :authenticate_admin!

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to action: :index
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
		   redirect_to owner_genres_path
		else
		   render :edit
		end
	end

	private

	def genre_params
		params.require(:genre).permit(:name, :is_active)
	end


end
