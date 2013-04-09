class TopController < CommonPageController

  def index
    @entries = Entry.includes([:feed, :clip]).order('published_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

end
