class DescritivoFaturasController < ApplicationController
  before_action :set_descritivo_fatura, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?

  # GET /descritivo_faturas
  # GET /descritivo_faturas.json
  def index
    @descritivo_faturas = DescritivoFatura.where(:clinica_id => session[:clinica_id])
  end

  # GET /descritivo_faturas/1
  # GET /descritivo_faturas/1.json
  def show
  end

  # GET /descritivo_faturas/new
  def new
    @descritivo_fatura = DescritivoFatura.new
  end

  # GET /descritivo_faturas/1/edit
  def edit
  end

  # POST /descritivo_faturas
  # POST /descritivo_faturas.json
  def create
    @descritivo_fatura = DescritivoFatura.new(descritivo_fatura_params)

    respond_to do |format|
      if @descritivo_fatura.save
        format.html { redirect_to @descritivo_fatura.fatura, notice: 'Descritivo fatura was successfully created.' }
        format.json { render action: 'show', status: :created, location: @descritivo_fatura }
      else
        format.html { render action: 'new' }
        format.json { render json: @descritivo_fatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descritivo_faturas/1
  # PATCH/PUT /descritivo_faturas/1.json
  def update
    respond_to do |format|
      if @descritivo_fatura.update(descritivo_fatura_params)
        format.html { redirect_to @descritivo_fatura, notice: 'Descritivo fatura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @descritivo_fatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descritivo_faturas/1
  # DELETE /descritivo_faturas/1.json
  def destroy
    @descritivo_fatura.destroy
    respond_to do |format|
      format.html { redirect_to descritivo_faturas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descritivo_fatura
      @descritivo_fatura = DescritivoFatura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descritivo_fatura_params
      params.require(:descritivo_fatura).permit(:fatura_id, :descricao, :valor)
    end
end
