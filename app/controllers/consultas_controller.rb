class ConsultasController < ApplicationController
  include ApplicationHelper
  before_action :set_consulta, only: [:show, :edit, :update, :destroy]

  # GET /consultas
  # GET /consultas.json
  def index
    @consultas = Consulta.all.reverse
    respond_to do |format|
        format.xml {render :xml => @consultas}
        format.json {render :json => @consultas}
        format.html {render :html => @consultas}
    end
  end

  # GET /consultas/1
  # GET /consultas/1.json
  def show
  end

  # GET /consultas/new
  def new
    @consulta = Consulta.new
  end

  # GET /consultas/1/edit
  def edit
    @consulta = Consulta.find(params[:id])
  end

  # POST /consultas
  # POST /consultas.json
  def create
    @consulta = Consulta.new(consulta_params)

    respond_to do |format|
      if @consulta.save
        format.html { redirect_to @consulta, notice: 'Consulta was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consulta }
      else
        format.html { render action: 'new' }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultas/1
  # PATCH/PUT /consultas/1.json
  def update
    respond_to do |format|
      if @consulta.update(consulta_params)
        format.html { redirect_to @consulta, notice: 'Consulta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultas/1
  # DELETE /consultas/1.json
  def destroy
    @consulta.destroy
    respond_to do |format|
      format.html { redirect_to consultas_url }
      format.json { head :no_content }
    end
  end
  def calendario
    @consultas = Consulta.all.reverse
    respond_to do |format|
      format.xml {render :xml => @consultas}
      format.json {render :json => @consultas}
      format.html {render :html => @consultas}
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.

    def set_consulta
      @consulta = Consulta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consulta_params
      params.require(:consulta).permit(:data, :hora_inicio, :hora_fim, :tipo, :procedimento_id, :paciente_id, :convenio_id, :dentista_id, :observacao, :status)
    end
end
