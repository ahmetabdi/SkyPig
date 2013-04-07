class MoviesController < ApplicationController
require 'imdb_party'
require 'httparty'
require 'json'
require 'will_paginate/array'

	def index
		@movies = ImdbParty::Imdb.new
		@results = @movies.find_by_title(params[:search_movie]).as_json
		@result = @results.paginate(:page => params[:page], :per_page => 5)
		s3 = AWS::S3.new
		@bucket = s3.buckets['imdb_images']
	end

	def show
		@movies = ImdbParty::Imdb.new
		@movie = @movies.find_movie_by_id(params[:movie])
		s3 = AWS::S3.new
		@bucket = s3.buckets['imdb_images']
	end

end