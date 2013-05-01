require 'spec_helper'

describe GamesController do

  before do
    @game = GiantBomb::Game.detail(500)
  end

  it "should return a id" do
    @movie.id.should eq(500)
  end

  it "should return a name" do
    @movie.imdb_id.should eq("The Thing")
  end

  it "should return a deck" do
    @movie.title.should eq("The semi-sequel to the 1982 sci-fi horror film.")
  end

  it "should return a description" do
    @movie.description.should eq(0)
  end

  it "should return a image" do
    @movie.image.should eq("")
  end

  it "should return a original_release_date" do
    @movie.original_release_date.should eq("19/08/2002")
  end
    
end