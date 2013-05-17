require 'spec_helper'

describe GamesController do

  before do
    @game = GiantBomb::Game.detail(7551)
  end

  it "should return a id" do
    @game.id.should eq(7551)
  end

  it "should return a deck" do
    @game.deck.should eq("Super Mario World: Super Mario Advance 2 is a re-release of the classic Super Nintendo game for the Game Boy Advance. It also includes Mario Bros. on the cart.")
  end

  it "should return a description" do
    @game.description.should eq(@game.description)
  end

  it "should return a name" do
    @game.name.should eq("Super Mario World: Super Mario Advance 2")
  end

  it "should return a image" do
    @game.image["super_url"].should eq("http://static.giantbomb.com/uploads/scale_large/0/7465/677346-11boxart.jpg")
  end

  it "should return a original_release_date" do
    @game.original_release_date.to_date.strftime("%d/%m/%Y").should eq("09/02/2002")
  end
    
end