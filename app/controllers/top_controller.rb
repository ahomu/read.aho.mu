class TopController < ApplicationController

  def index
    @entries = Entry.order('published_at DESC').all

    render
  end

end
