class BoxesController < ApplicationController

  before_action :set_box, only: [:show, :edit, :update, :destroy]

  def index
  	@boxes = Box.all
  end

  def show
  	
  end

  def new
  	@box = Box.new
    @brands = Brand.all 
  end

  def create
  	@box = Box.new(box_params)

    respond_to do |format|
      if @box.save
        flash[:sucess] = 'A caixa foi criada com sucesso.'
        format.html { redirect_to @box }
        format.json { render :show, status: :created, location: @box }
      else
        flash[:danger] = 'Houve um problema ao criar a caixa.'
        format.html { render :new }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def edit
    @brands = Brand.all 
  end

  def update
  	respond_to do |format|
      if @box.update(box_params)
	    flash[:sucess] = 'A caixa foi alterada com sucesso.'
        format.html { redirect_to @box }
        format.json { render :show, status: :ok, location: @box }
      else
		flash[:danger] = 'Houve um problema ao alterar a caixa.'
        format.html { render :edit }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @box.destroy
    respond_to do |format|
	  flash[:sucess] = 'A caixa foi removida com sucesso.'
      format.html { redirect_to @box }
      format.json { head :no_content }
    end
  end

  private
  	def set_box
      @box = Box.find(params[:id])
    end

    def box_params
      params.require(:box).permit(:brand_id, :box_limite, :box_price)
    end
end
