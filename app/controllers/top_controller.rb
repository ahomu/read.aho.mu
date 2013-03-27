class TopController < CommonPageController

  def index
    @entries = Entry.includes([:feed, :clip]).order('published_at DESC').page params[:page]

    p ActiveAdmin

    render
  end

end
