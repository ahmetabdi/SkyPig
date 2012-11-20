class ApplicationController < ActionController::Base
  protect_from_forgery

  #Giantbomb API KEY
  GiantBomb::Api.key('283c35812a2a90b1946af066834b87c9a202ef61')

end
