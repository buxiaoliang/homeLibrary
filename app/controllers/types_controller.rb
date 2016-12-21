class TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    respond_to do |format|
      if @type.save
        flash[:success] = 'New type was successfully created.'
        format.html { redirect_to @type }
      else
        flash[:danger] = 'There was a problem creating the type.'
        format.html { render :new }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update(type_params)
        flash[:success] = 'New type was successfully updated.'
        format.html { redirect_to @type }
      else
        flash[:danger] = 'There was a problem updating the type.'
        format.html { render :edit }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    redirect_to types_path
  end

  def show
    @type = Type.find(params[:id])
  end

  def index
    @types = Type.all
  end
  # private: need to be at end of class
  private
  def type_params
    params.require(:type).permit(:name, :description)
  end
end
