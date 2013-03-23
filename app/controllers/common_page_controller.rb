class CommonPageController < ApplicationController
  protect_from_forgery
  before_filter :navigate_data

  private
  def navigate_data
    @nav_categories = Category.all
    @nav_feeds = Feed.all
  end
end
