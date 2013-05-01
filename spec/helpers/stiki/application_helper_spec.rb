require 'spec_helper'
require 'stiki/application_helper'
require 'ostruct'

describe Stiki::ApplicationHelper do
  it "should expose Stiki routes" do
    helper.stiki_routes.should eql Stiki::Engine.routes.url_helpers
  end
  
  it "should get user_name for user" do
    Stiki.user_name_via = :name
    
    author = OpenStruct.new
    author.user = OpenStruct.new( :name => 'test' )
    
    helper.user_name( author ).should eql 'test'
  end
  
  describe "#has_access" do 
    before do 
      view.stub!(:current_user).and_return( Author.new ) 
    end 
    
    context "disabled" do
      before do
        Stiki.authorize_by = false
      end
      
      it "should always be true" do
        helper.has_access(:action, nil ).should be_true
        helper.has_access(nil, Author.new ).should be_true
      end
    end
    
    context "enabled" do
      before do
        Stiki.authorize_by = :cancan
      end
      
      it "should be authorized for index" do
        helper.has_access(:index, Stiki::Author ).should be_true
      end
      
      it "should not be authorized for create" do
        helper.has_access(:create, Stiki::Author ).should be_false
      end
    end
  end
end