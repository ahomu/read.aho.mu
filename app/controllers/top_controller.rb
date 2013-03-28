class TopController < CommonPageController

  def index
    @entries = Entry.includes([:feed, :clip]).order('published_at DESC').page params[:page]

    render
  end

end
