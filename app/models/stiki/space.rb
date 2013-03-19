module Stiki
  class Space < ActiveRecord::Base
    self.table_name = "stiki_spaces"
    
    extend ::FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :pages
    has_many :authors, :as => :authorable do
      def <<(*authors)
        # prevent duplicate authors
        existing_users = proxy_association.owner.authors.map(&:user_id)
        super( authors.select { |auth| !existing_users.include?( auth.user_id ) } )
      end
    end
    has_one :creator, :class_name => 'Author', :conditions => ["creator = ?", true], :as => :authorable
    
    attr_accessible :name, :slug
    
    validates :name, :uniqueness => true, :presence => true
    after_validation :move_friendly_id_error_to_name

    protected
    def move_friendly_id_error_to_name
      errors.add :name, *errors.delete(:friendly) if errors[:friendly].present?
    end
  end
end
