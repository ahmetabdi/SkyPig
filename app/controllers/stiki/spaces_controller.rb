require_dependency "stiki/application_controller"

module Stiki
  class SpacesController < ApplicationController
    def index
      @spaces = Space.all
      @space = Space.new
    end
    
    # def show handled by PageController#index
    def edit
      @space = Space.find(params[:id])
    end
    
    def create
      @space = Space.new(params[:space])
      
      if Stiki.authenticate_by == :devise
        author = Author.new
        author.user_id = current_user.id
        author.creator = true
        @space.authors << author
      end
      
      unless @space.save
        flash[:error] = "Error creating new Space"
      end
      
      redirect_to stiki_routes.spaces_path
    end
    
    def update
      @space = Space.find(params[:id])
      @space.attributes = params[:space]
      
      if Stiki.authenticate_by == :devise
        author = Author.new
        author.user_id = current_user.id
        @space.authors << author
      end
      
      if @space.save
        flash[:notice] = "Space Updated"
        
        redirect_to stiki_routes.spaces_path
      else
        flash[:error] = "Error creating new Space"
        render :template => 'stiki/spaces/edit'
      end
    end
    
    def destroy
      @space = Space.find( params[:id] )
      
      if @space.pages.size > 0 
        flash[:error] = "Cannot delete a Wiki Space that has Wiki Pages"
      else
        @space.destroy
        flash[:notice] = "The Space #{@space.name} has been deleted"
      end
      
      redirect_to stiki_routes.spaces_path
    end
  end
end
