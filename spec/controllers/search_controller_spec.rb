require 'spec_helper'

describe SearchController do

  before(:each) do
    @movie = Tmdb::Movie.find('batman')
    @game = GiantBomb::Game.find('mario')
    @person = Tmdb::People.find('samuel')
  end
    
  it "should return movies" do
    response.should be_success
  end
      
  it "should return games" do
    response.should be_success
  end
              
  it "should return people" do
    response.should be_success
  end
    
end