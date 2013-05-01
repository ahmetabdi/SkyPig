require 'spec_helper'
require 'stiki/spaces_controller'

describe Stiki::SpacesController do
  
  describe "GET #index" do
    before do
      @space1 = FactoryGirl.create(:space)
      @space2 = FactoryGirl.create(:space)
      @space3 = FactoryGirl.create(:space)
      
      get :index, :use_route => :stiki
    end
    
    it { response.should be_success }
    it { should assign_to(:spaces) }
    it { assigns(:spaces).size.should eql 3 }
    it { should render_template('stiki/spaces/index') }
  end
  
  describe "GET #create" do
    context "success" do
      before do
        expect {
          post :create, :space => { :name => 'name123' }, :use_route => :stiki
        }.to change{ Stiki::Space.count }.by(1)
      end
      
      it { response.should be_redirect }
    end
    
    context "error" do
      before do
        expect {
          post :create, :use_route => :stiki
        }.to change{ Stiki::Space.count }.by(0)
      end
      
      it { response.should be_redirect }
    end
  end
  
end
