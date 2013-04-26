class PersonController < ApplicationController

	def show
		@person = Tmdb::People.detail(params[:id])
		@movies = Tmdb::People.credits(params[:id])
	end

end