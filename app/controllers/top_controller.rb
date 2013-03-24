class TopController < CommonPageController

  def index
    @entries = Entry.order('published_at DESC').page params[:page]

    render
  end

end
