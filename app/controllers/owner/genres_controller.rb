class Owner::GenresController < ApplicationController

	before_action :authenticate_admin!

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			flash[:notice] = "新しいジャンルを追加しました。"
			redirect_to action: :index
		else
			@genres = Genre.all
			flash[:alert] = "エラーが発生しました。"
			render :index
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			flash[:notice] = "更新しました。"
			redirect_to owner_genres_path
		else
			flash[:alert] = "エラーが発生しました。"
			render :edit
		end
	end

	private

	def genre_params
		params.require(:genre).permit(:name, :is_active)
	end


end
