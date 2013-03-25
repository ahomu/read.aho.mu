class TopController < CommonPageController

  def index
    @entries = Entry.includes(:feed).order('published_at DESC').page params[:page]

    render
  end

end
