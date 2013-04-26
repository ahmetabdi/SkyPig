class SearchController < ApplicationController
	def index
		@movie = Tmdb::Movie.find(params[:query])
		@movie_result = @movie.paginate(:page => params[:page], :per_page => 5)

		@game = GiantBomb::Game.find(params[:query])
		@game_result = @game.paginate(:page => params[:page], :per_page => 5)

		@person = Tmdb::People.find(params[:query])
		@person_result = @person.paginate(:page => params[:page], :per_page => 5)
	end
end