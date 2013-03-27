class Entry < ActiveRecord::Base
  belongs_to :feed, :include => :category
  has_one :clip
  delegate :category, :to => :feed, :allow_nil => true
  attr_accessible :feed_id, :summary, :title, :url, :published_at

  # kaminari
  default_scope :order => 'published_at DESC'
  paginates_per 20
end
