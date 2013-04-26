class ApplicationController < ActionController::Base
  protect_from_forgery
	require 'themoviedb'
  require 'giantbomb'
  require 'will_paginate/array'
  require 'httparty'
  require 'json'
  before_filter :set_config

  #Giantbomb API Key
  GiantBomb::Api.key('283c35812a2a90b1946af066834b87c9a202ef61')

  #Themoviedb API Key
  Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")

  def set_config
  	@configuration = Tmdb::Configuration.new
  end

end
