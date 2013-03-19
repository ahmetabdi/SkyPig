require 'friendly_id'
require 'carrierwave/orm/activerecord'

module Stiki
  class Page < ActiveRecord::Base
    self.table_name = "stiki_pages"
    attr_accessible :body, :title, :slug, :parent_id, :space_id, :image, :image_cache
    mount_uploader :image, ImageUploader

    extend ::FriendlyId
    friendly_id :title, use: :slugged
    
    belongs_to :space
    has_many :authors, :as => :authorable do
      def <<(*authors)
        # prevent duplicate authors
        existing_users = proxy_association.owner.authors.map(&:user_id)
        super( authors.select { |auth| !existing_users.include?( auth.user_id ) } )
      end
    end
    
    validates :title, :uniqueness => {:scope => :space_id}, :presence => true
    validates :body, :presence => true
    after_validation :move_friendly_id_error_to_name

    def mark_badges
      if authors.size > 1
        # XXX: need revisions to determine last edit and most edits
        #last = authors.order( 'updated_at DESC' ).first
        #authors.where( ["#{Stiki::Author.table_name}.id != ?", last.id] ).update_all( :last_edit => false );
        #authors.where( ["#{Stiki::Author.table_name}.id = ?", last.id] ).update_all( :last_edit => true );
      end
    end
    
    protected
    def move_friendly_id_error_to_name
      errors.add :title, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
  end
end
