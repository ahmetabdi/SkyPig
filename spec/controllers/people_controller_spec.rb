require 'spec_helper'

describe PersonController do

  before do
    @person = Tmdb::People.detail(287)
  end

  it "should return a id" do
    @person.id.should eq(287)
  end

  it "should return a name" do
    @person.name.should eq("Brad Pitt")
  end

  it "should return a place_of_birth" do
    @person.place_of_birth.should eq("Shawnee, Oklahoma, United States")
  end

  it "should return a biography " do
    @person.biography.should eq(@person.biography)
  end

  it "should return a birthday" do
    @person.birthday.should eq("1963-12-18")
  end

  it "should return a deathday" do
    @person.deathday.should eq("")
  end

  it "should return a homepage" do
    @person.homepage.should eq("http://simplybrad.com/")
  end

  it "should return a profile_path" do
    @person.profile_path.should eq("/w8zJQuN7tzlm6FY9mfGKihxp3Cb.jpg")
  end
    
end