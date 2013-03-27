class Clip < ActiveRecord::Base
  attr_accessible :entry_id
  belongs_to :entry
end
