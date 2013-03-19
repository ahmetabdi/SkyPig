module Stiki
  module ApplicationHelper
    def stiki_routes
      Stiki::Engine.routes.url_helpers
    end
    
    def has_access( action, model )
      if Stiki.authorize_by == :cancan
        can? action, model
      else
        true
      end
    end
    
    def user_name( author )
      if Stiki.user_name_via 
        author.user.send( Stiki.user_name_via ) if author && author.user
      end
    end
  end
end
