class TopController < CommonPageController

  def index
    @entries = Entry.order('published_at DESC').all

    render
  end

end
