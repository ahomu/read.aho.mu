class FeedsController < CommonPageController
  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feed = Feed.find(params[:id])
    @entries = @feed.entries.includes(:feed).page params[:page]
    @category = @feed.category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=>{
          :feed     => @feed,
          :category => @category,
          :entries  => @entries
      }}

    end
  end
  #
  ## GET /feeds/new
  ## GET /feeds/new.json
  #def new
  #  @feed = Feed.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @feed }
  #  end
  #end
  #
  ## GET /feeds/1/edit
  #def edit
  #  @feed = Feed.find(params[:id])
  #  @categories = Category.all
  #end
  #
  ## POST /feeds
  ## POST /feeds.json
  #def create
  #  @feed = Feed.new(params[:feed])
  #
  #  respond_to do |format|
  #    if @feed.save
  #      format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
  #      format.json { render json: @feed, status: :created, location: @feed }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @feed.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## PUT /feeds/1
  ## PUT /feeds/1.json
  #def update
  #  @feed = Feed.find(params[:id])
  #
  #  respond_to do |format|
  #    if @feed.update_attributes(params[:feed])
  #      format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @feed.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /feeds/1
  ## DELETE /feeds/1.json
  #def destroy
  #  @feed = Feed.find(params[:id])
  #  @feed.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to feeds_url }
  #    format.json { head :no_content }
  #  end
  #end
end
