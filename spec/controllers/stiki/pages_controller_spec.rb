require 'spec_helper'
require 'stiki/pages_controller'

describe Stiki::PagesController do
  
  before do
    Stiki.config do |stiki|
      stiki.user_class = 'Author'
      stiki.authorize_by = false
    end
  end
  
  it "should have before_filters" do
      Stiki::PagesController.filters[:before].should include(:get_space);
  end
  
  describe "GET #index" do
    before do
      @space = FactoryGirl.create(:space)
      get :index, :space_id => @space.slug, :use_route => :stiki
    end
    
    it { response.should be_success }
    it { should assign_to(:space) }
    it { should assign_to(:pages) }
    it { should render_template('stiki/pages/index') }
  end
  
  describe "GET #show" do
    before do
      @page = FactoryGirl.create(:page)
      @space = @page.space
      get :show, :space_id => @space.slug, :id => @page.slug, :use_route => :stiki
    end
    
    it { should_not set_the_flash }
    it { response.should be_success }
    it { should assign_to(:space) }
    it { should assign_to(:page) }
    it { should assign_to(:markup) }
    it { should render_template('stiki/pages/show') }
  end
  
  describe "GET #new" do
    before do
      @space = FactoryGirl.create(:space)
      get :new, :space_id => @space.slug, :use_route => :stiki
    end
    
    it { should_not set_the_flash }
    it { response.should be_success }
    it { should assign_to(:space) }
    it { should assign_to(:page) }
    it { should render_template('stiki/pages/new') }
  end
  
  describe "GET #create" do
    context "success" do
      before do
        @space = FactoryGirl.create(:space)
        post :create, :space_id => @space.slug, :page => { :title => 'title123', :body => 'body123' }, :use_route => :stiki
      end
      
      it { response.should be_redirect }
    end
    
    context "error" do
      before do
        @space = FactoryGirl.create(:space)
        post :create, :space_id => @space.slug, :use_route => :stiki
      end
      
      it { response.should be_success }
      it { should assign_to(:space) }
      it { should assign_to(:page) }
      it { should render_template('stiki/pages/new') }
      it "should not be a valid page" do 
        assigns(:page).should_not be_valid
      end
    end
  end
  
end
