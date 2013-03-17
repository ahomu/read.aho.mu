class Entry < ActiveRecord::Base
  belongs_to :feed
  attr_accessible :feed_id, :summary, :title, :url, :published_at
end
