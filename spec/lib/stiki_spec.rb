require 'spec_helper'
require 'stiki'


describe Stiki do
  
  describe "#config for devise" do
    before do
      Stiki.config do |stiki|
        stiki.authenticate_by = :devise
        stiki.user_class = 'Author'
        stiki.user_name_via = :to_s
        stiki.authenticate_pages = {:only =>  [:blue, :green, :orange ] }
        stiki.authenticate_spaces = {:only => [:new, :create, :edit, :update] }
      end
    end
    
    it "should set authenticate_by" do
      Stiki.authenticate_by.should eql :devise
    end
    
    it "should set user_name_via" do
      Stiki.user_name_via.should eql :to_s
    end
    
    it "should set auth_pages" do
      Stiki.authenticate_pages[:only].should eql( [:blue, :green, :orange ] )
    end
    
    it "should set auth_spaces" do
      Stiki.authenticate_spaces[:only].should eql( [:new, :create, :edit, :update] )
    end
  
  end
  
  describe "#config for authorize_by" do
    before do
      Stiki.config do |stiki|
        stiki.authorize_by = :hamsterdam
      end
    end
    
    it "should set authorized_by" do
      Stiki.authorize_by.should eql :hamsterdam
    end
  end
  
end