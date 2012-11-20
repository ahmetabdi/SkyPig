class ResultsController < ApplicationController
	require 'GiantBomb'
	require 'will_paginate/array'

	def index
		unless (params[:search] rescue nil).nil?
			@games = GiantBomb::Game.find(params[:search])
			@results =  @games.paginate(:page => params[:page], :per_page => 5)
		end
		#flash[:error] = "No search results could be found."

		#@page_results = @results.paginate(page: params[:page])
		#@games = @game.to_json
		#@games = @game.as_json
	end
end