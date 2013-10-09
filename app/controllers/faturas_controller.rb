class FaturasController < ApplicationController
  before_action :set_fatura, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?

  # GET /faturas
  # GET /faturas.json
  def index
    @faturas = Fatura.where(:clinica_id => session[:clinica_id])
  end

  # GET /faturas/1
  # GET /faturas/1.json
  def show
    if @fatura.nil?
      redirect_to faturas_path, notice: 'fatura não encontrada'
    end
  end

  # GET /faturas/new
  def new
    @fatura = Fatura.new
  end

  # GET /faturas/1/edit
  def edit
    if @fatura.nil?
      redirect_to faturas_path, notice: 'fatura não encontrada'
    end
  end

  # POST /faturas
  # POST /faturas.json
  def create
    @fatura = Fatura.new(fatura_params)

    respond_to do |format|
      if @fatura.save
        format.html { redirect_to @fatura, notice: 'Fatura was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fatura }
      else
        format.html { render action: 'new' }
        format.json { render json: @fatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faturas/1
  # PATCH/PUT /faturas/1.json
  def update
    respond_to do |format|
      if @fatura.update(fatura_params)
        format.html { redirect_to @fatura, notice: 'Fatura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faturas/1
  # DELETE /faturas/1.json
  def destroy
    @fatura.destroy
    respond_to do |format|
      format.html { redirect_to faturas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fatura
      @fatura = Fatura.where("id = ? AND clinica_id = ?", params[:id], session[:clinica_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fatura_params
      params.require(:fatura).permit(:consulta_id, :descricao, :desconto, :vencimento).merge(clinica_id: session[:clinica_id])
    end
end
