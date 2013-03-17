class Feed < ActiveRecord::Base
  belongs_to :category
  has_many :entries
  attr_accessible :feed_url, :title, :url, :last_modified, :category_id
end
