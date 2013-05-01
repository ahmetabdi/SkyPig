require 'spec_helper'
require 'stiki/authenticate/devise'

describe Stiki::Authenticate::Devise do
  
  describe "include in Controllers" do
    before do
      Stiki.config do |stiki|
        stiki.authenticate_by = :devise
        stiki.user_class = 'Author'
        stiki.authenticate_pages = :all
        stiki.authenticate_spaces = {:only => [:new, :create, :edit, :update]}
      end
    end
    
    it "should set before_filter in PagesController" do
      Stiki::PagesController.filters[:before].should include( :authenticate_author! )
    end
    
    it "should set before_filter in SpacesController" do
      Stiki::SpacesController.filters[:before].should include( :authenticate_author! )
    end

  end
  
end