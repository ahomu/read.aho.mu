class Category < ActiveRecord::Base
  has_many :feeds
  has_many :entries, :through => :feeds
  attr_accessible :color, :name
end
