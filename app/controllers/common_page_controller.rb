class CommonPageController < ApplicationController
  protect_from_forgery
  before_filter :navigate_data

  private
  def navigate_data
    @nav_categories = Category.all(:include => :feeds)
  end
end
