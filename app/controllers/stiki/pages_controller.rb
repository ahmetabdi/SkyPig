require_dependency "stiki/application_controller"
require 'kramdown'

module Stiki
  class PagesController < ApplicationController
    before_filter :get_space, :except => [:search]
    
    def index
      @spaces = Space.all
      @pages = @space.pages
    end
    
    def show
      @spaces = Space.all
      @pages = @space.pages
      
      @page = Page.find_by_slug( params[:id] )
      
      if @page.nil?
        flash[:error] = "Wiki Pages does not exist: #{params[:id]}"
        redirect_to stiki_routes.space_pages_path(@space)
      else
        markdown = Kramdown::Document.new(@page.body)
        
        @markup = markdown.to_html.html_safe
      end
    end

    def search
      @spaces = Space.all
      

      @page = Page.find(:all, :conditions => ["stiki_pages.title LIKE ?", "%#{params[:search_wiki]}%"] )
      @page =  @page.paginate(:page => params[:page], :per_page => 6)
      
      if @page.nil?
        flash[:error] = "Wiki Pages does not exist: #{params[:id]}"
        redirect_to stiki_routes.space_pages_path(@space)
      else
        #markdown = Kramdown::Document.new(@page.body)
        
        #@markup = markdown.to_html.html_safe
      end
    end
    
    def new
      @page = Page.new
    end
    
    def edit
      @page = Page.find(params[:id])
    end
    
    def create
      @page = Page.new(params[:page])
      @page.space = @space
      
      if Stiki.authenticate_by == :devise
        author = Author.new
        author.user_id = current_user.id
        author.creator = true
        @page.authors << author
      end
      
      if @page.save
        redirect_to stiki_routes.space_page_path(@space, @page)
      else
        flash[:error] = "Error creating Page"
        render "stiki/pages/new"
      end
    end
    
    def update
      @page = Page.find( params[:id] )
      
      @page.attributes = params[:page]
      
      if Stiki.authenticate_by == :devise
        author = Author.new
        author.user_id = current_user.id
        @page.authors << author
      end
      
      if @page.save
        @page.mark_badges
        redirect_to stiki_routes.space_page_path(@space, @page)
      else
        flash[:error] = "Error editing Page"
        render "stiki/pages/edit"
      end
    end
    
    def destroy
      @page = Page.find( params[:id] )
      
      @page.destroy
      
      redirect_to stiki_routes.space_pages_path(@space)
    end
    
    protected
    def get_space
      @space = Space.find_by_slug( params[:space_id] )
      if @space.nil?
        flash[:error] = "Wiki Space does not exist: #{params[:space_id]}"
        redirect_to stiki_routes.spaces_path
      end
    end
  end
end
