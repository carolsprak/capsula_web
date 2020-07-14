class StocksController < ApplicationController

  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
  	@stocks = Stock.all

  end

  def show
  	
  end

  def new
  	@stock = Stock.new
    @drinks = Drink.all
  end

  def create
  	@stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        flash[:sucess] = 'O produto foi criada com sucesso.'
        format.html { redirect_to @stock }
        format.json { render :show, status: :created, location: @stock }
      else
        flash[:danger] = 'Houve um problema ao criar o produto.'
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def edit
    @drinks = Drink.all
  end

  def update
  	respond_to do |format|
      if @stock.update(stock_params)
	    flash[:sucess] = 'O produto foi alterada com sucesso.'
        format.html { redirect_to @stock }
        format.json { render :show, status: :ok, location: @stock }
      else
		flash[:danger] = 'Houve um problema ao alterar o produto.'
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock.destroy
    respond_to do |format|
	  flash[:sucess] = 'O produto foi removida com sucesso.'
      format.html { redirect_to @stock }
      format.json { head :no_content }
    end
  end

  private
  	def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:drink_id, :quantity)
    end
end
