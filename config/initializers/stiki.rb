Stiki.config do |stiki|
  # Optional user class, required for author and devise
  stiki.user_class = 'User' 

  # Method to be called on user_class to display user name. Defaults to to_s
  stiki.user_name_via = :username

  # Optional, use devise for authentication
  stiki.authenticate_by = :devise 
  stiki.authenticate_pages = {:only => [:create, :edit, :new, :update, :destroy]}  # other options are :only => [actions]  or :except => [actions]
  stiki.authenticate_spaces = {:only => [:create, :edit, :new, :update, :destroy]}  # other options are :only => [actions] or :except => [actions]

  # Optional, use cancan for authorization
  #stiki.authorize_by = :cancan
end