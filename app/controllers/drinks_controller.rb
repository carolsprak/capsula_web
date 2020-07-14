 class DrinksController < ApplicationController
 before_action :set_drink, only: [:show, :edit, :update, :destroy]

  def index
  	@drinks = Drink.all

   # api_request('2018042510000304')
    
  end

  def api_request(otrs)
    require 'net/http'
    require 'net/https'
    require 'open-uri'
    require 'json'

    us = 'https://app.sti.ufpb.br/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector/Ticket?UserLogin=servico_otrs&Password=Zot0c%25r9&TicketNumber='+ otrs.to_s

    uri = URI.parse(us)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
            
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)
    response.body
    ticketid = JSON.parse(response.body)['TicketID'][0]
    

    url = "https://app.sti.ufpb.br/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector/Ticket/" + ticketid.to_s + "?UserLogin=servico_otrs&Password=Zot0c%25r9https://app.sti.ufpb.br/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector/Ticket/54801?UserLogin=servico_otrs&Password=Zot0c%25r9&AllArticles=1"
      
    content = open(url ,{ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read

    @titulo = JSON.parse(content)['Ticket'][0]['Title']
    @description = JSON.parse(content)['Ticket'][0]['Article'][0]['Body']
    @ticketNumber = JSON.parse(content)['Ticket'][0]['TicketNumber']
        
  end

  def show
  	
  end

  def new
  	@drink = Drink.new
  	@brands = Brand.all 
  end

  def create
  	@drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        flash[:sucess] = 'A bebida foi criada com sucesso.'
        format.html { redirect_to @drink }
        format.json { render :show, status: :created, location: @drink }
      else
        flash[:danger] = 'Houve um problema ao criar a bebida.'
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def edit
  	@brands = Brand.all 
  end

  def update
  	
  	respond_to do |format|
      if @drink.update(drink_params)
	    flash[:sucess] = 'A bebida foi alterada com sucesso.'
        format.html { redirect_to @drink }
        format.json { render :show, status: :ok, location: @drink }
      else
		flash[:danger] = 'Houve um problema ao alterar a bebida.'
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @drink.destroy
    respond_to do |format|
	  flash[:sucess] = 'A bebida foi removida com sucesso.'
      format.html { redirect_to @drink }
      format.json { head :no_content }
    end
  end

  private
  	def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:otrs,:brand_id, :drink_type, :drink_category, :description, :qt_capsule)
    end

end