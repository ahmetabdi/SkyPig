module Stiki
  class Author < ActiveRecord::Base
    self.table_name = "stiki_authors"
    
    belongs_to :authorable, :polymorphic => true
    
    validates :creator, :uniqueness => {:scope => [:authorable_id, :authorable_type] }
  end
end
