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
        flash[:danger] = 'There was a problem creating the Todo.'
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
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
  end

  # private: need to be at end of class
  private
      def stuff_params
      params.require(:stuff).permit(:name, :description, :location_id, :type_id)
    end
end
