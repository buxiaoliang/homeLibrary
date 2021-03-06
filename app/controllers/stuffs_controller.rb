class StuffsController < ApplicationController
  def new
    @stuff = Stuff.new
  end

  def create
    @stuff = Stuff.new(stuff_params)
    if params[:stuff][:image]
      @stuff.image = params[:stuff][:image].read
    end
    #render plain: params[:stuff].inspect
    #if @stuff.save
    #redirect_to @stuff
    #else
    #render 'new'
    #end
    respond_to do |format|
      if @stuff.save
        flash[:success] = 'New stuff was successfully created.'
        format.html { redirect_to @stuff }
      else
        flash[:danger] = 'There was a problem creating the stuff.'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @stuff = Stuff.find(params[:id])
  end

  def update
    @stuff = Stuff.find(params[:id])

    respond_to do |format|
      if @stuff.update(stuff_params)
        flash[:success] = 'New stuff was successfully updated.'
        format.html { redirect_to @stuff }
      else
        flash[:danger] = 'There was a problem updating the stuff.'
        format.html { render :edit }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stuff = Stuff.find(params[:id])
    @stuff.destroy

    redirect_to stuffs_path
  end

  def show
    @stuff = Stuff.find(params[:id])
  end

  def show_image
    @stuff = Stuff.find(params[:id])
    send_data @stuff.image, :type => 'image/png',:disposition => 'inline'
  end

  def index
    @stuffs = Stuff.all
    if params[:search]
      @stuffs = Stuff.search(params[:search]).order("created_at DESC")
    else
      @stuffs = Stuff.all.order('created_at DESC')
    end
  end

  # private: need to be at end of class
  private
    def stuff_params
      params.require(:stuff).permit(:name, :description, :location_id, :type_id)
    end
end
