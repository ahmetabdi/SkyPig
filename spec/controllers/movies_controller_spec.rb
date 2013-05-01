require 'spec_helper'

describe MoviesController do

  before do
    @movie = Tmdb::Movie.detail(22855)
  end

  it "should return a id" do
    @movie.id.should eq(22855)
  end

  it "should return a imdb id" do
    @movie.imdb_id.should eq("tt1398941")
  end

  it "should return a title" do
    @movie.title.should eq("Superman/Batman: Public Enemies")
  end

  it "should return a revenue" do
    @movie.revenue.should eq(0)
  end

  it "should return a tagline" do
    @movie.tagline.should eq("")
  end

  it "should return a runtime" do
    @movie.runtime.should eq(67)
  end

  it "should return a vote_count" do
    @movie.vote_count.should eq(11)
  end

  it "should return a vote_average" do
    @movie.vote_average.should eq(7.4)
  end

  it "should return a status" do
    @movie.status.should eq("Released")
  end
    
end