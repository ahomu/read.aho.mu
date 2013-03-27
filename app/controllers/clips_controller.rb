class ClipsController < InheritedResources::Base

  def create
    @clip = Clip.new({:entry_id => params[:entry_id]})

    respond_to do |format|
      if @clip.save
        format.json { render json: @clip }
        #format.html { redirect_to @clip, notice: 'Entry was successfully clipped.' }
        #format.json { render json: @clip, status: :created, location: @clip }
      else
        format.json { render json: @clip.errors }
        #format.html { render action: "new" }
        #format.json { render json: @clip.errors, status: :unprocessable_entity }
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
