module Stiki
  class ApplicationController < ActionController::Base 
    include Stiki::ApplicationHelper  
    layout "application"  
  end
end
