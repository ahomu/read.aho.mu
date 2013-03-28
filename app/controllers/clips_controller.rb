class ClipsController < InheritedResources::Base

  before_filter :authenticate_admin_user!

  def create
    @clip = Clip.new({:entry_id => params[:entry_id]})

    respond_to do |format|
      if @clip.save
        format.json { render json: @clip }
      else
        format.json { render json: @clip.errors }
      end
    end
  end

  def destroy
    @clip = Clip.find(params[:id])

    respond_to do |format|
      if @clip.destroy
        format.json { render json: @clip }
      else
        format.json { render json: @clip.errors }
      end
    end
  end
end
