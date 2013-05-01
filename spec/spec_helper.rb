# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'shoulda-matchers'
require 'cancan'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

require 'factory_girl'
FactoryGirl.find_definitions

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  # config.order = "random"
  
  config.include FactoryGirl::Syntax::Methods
end

# Devise does not like modules 
class Author < ActiveRecord::Base
    self.table_name = "stiki_authors"
end

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    author ||= Author.new # guest user (not logged in)
  
    can :manage, Stiki::Page
    can :manage, Stiki::Space
    can :index,  Stiki::Author
    
  end
end

class ActionView::TestCase::TestController    
    def current_user
      Author.new
    end
end


# Shim the Stiki ApplicationController to get access to the filters
# and stub the devise before_filter method
class Stiki::ApplicationController 

  def self.filters(kind = nil)
    all_filters = _process_action_callbacks
    
    filters = {}
    all_filters.each do |filter|
      filters[filter.kind] = [] if filters[filter.kind].nil?
      filters[filter.kind] << filter.filter
    end
    filters
    
  end
  
  def current_author
    Author.new
  end
  
  def authenticate_author!
    
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_author)
  end

end
