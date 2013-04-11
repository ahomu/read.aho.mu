class CategoriesController < CommonPageController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {
        :categories => @categories
      }}
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @feeds    = @category.feeds
    @entries  = @category.entries.includes([:feed, :clip]).page params[:page]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => {
        :category => @category,
        :feeds    => @feeds,
        :entries  => @entries # TODO entryごとのclipがjsonに含まれてない
      }}
    end
  end

end
