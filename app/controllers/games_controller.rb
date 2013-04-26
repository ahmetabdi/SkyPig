class GamesController < ApplicationController

	def show
		@game = GiantBomb::Game.detail(params[:id])
	end

end