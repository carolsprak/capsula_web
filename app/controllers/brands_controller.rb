class BrandsController < ApplicationController

  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
  	@brands = Brand.all
  end

  def show
  	
  end

  def new
  	@brand = Brand.new
  end

  def create
  	@brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        flash[:sucess] = 'A marca foi criada com sucesso.'
        format.html { redirect_to @brand }
        format.json { render :show, status: :created, location: @brand }
      else
        flash[:danger] = 'Houve um problema ao criar a marca.'
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def edit
  end

  def update
  	respond_to do |format|
      if @brand.update(brand_params)
	    flash[:sucess] = 'A marca foi alterada com sucesso.'
        format.html { redirect_to @brand }
        format.json { render :show, status: :ok, location: @brand }
      else
		flash[:danger] = 'Houve um problema ao alterar a marca.'
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand.destroy
    respond_to do |format|
	  flash[:sucess] = 'A marca foi removida com sucesso.'
      format.html { redirect_to @brand }
      format.json { head :no_content }
    end
  end

  private
  	def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name, :description)
    end
end
