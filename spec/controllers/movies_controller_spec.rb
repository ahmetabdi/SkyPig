require 'spec_helper'

describe MoviesController do

  before do
    @movie = Tmdb::Movie.detail(68721)
  end

  it "should return a id" do
    @movie.id.should eq(68721)
  end

  it "should return a imdb id" do
    @movie.imdb_id.should eq("tt1300854")
  end

  it "should return a title" do
    @movie.title.should eq("Iron Man 3")
  end

  it "should return a revenue" do
    @movie.revenue.should eq(0)
  end

  it "should return a tagline" do
    @movie.tagline.should eq("Unleash the power behind the armor.")
  end

  it "should return a runtime" do
    @movie.runtime.should eq(130)
  end

  it "should return a vote_count" do
    @movie.vote_count.should eq(78)
  end

  it "should return a vote_average" do
    @movie.vote_average.should eq(5.6)
  end

  it "should return a status" do
    @movie.status.should eq("Released")
  end
    
end