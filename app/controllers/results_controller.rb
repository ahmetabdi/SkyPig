class ResultsController < ApplicationController
	require 'giantbomb'
	require 'will_paginate/array'

	def index
		unless (params[:search] rescue nil).nil?
			@games = GiantBomb::Game.find(params[:search])
			@results = @games.paginate(:page => params[:page], :per_page => 5)
		end
		if @results.empty? || @results.nil?
			redirect_to :back
			flash[:error] = "No search results could be found."
		end
		
	end

	def show
		@game = GiantBomb::Game.find(params[:game])
		@game = @game.first
	end


end