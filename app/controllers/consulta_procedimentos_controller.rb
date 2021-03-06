# -*- encoding : utf-8 -*-
class ConsultaProcedimentosController < ApplicationController
  before_action :set_consulta_procedimento, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?

  # GET /consulta_procedimentos
  # GET /consulta_procedimentos.json
  def index
    @consulta_procedimentos = ConsultaProcedimento.where(:clinica_id => session[:clinica_id])
  end

  # GET /consulta_procedimentos/1
  # GET /consulta_procedimentos/1.json
  def show
  end

  # GET /consulta_procedimentos/new
  def new
    @consulta_procedimento = ConsultaProcedimento.new
    @consulta = Consulta.where("id = ? and clinica_id= ?", params[:consulta_id], session[:clinica_id]).first
    consulta_id = params[:consulta_id]
  end

  # GET /consulta_procedimentos/1/edit
  def edit
  end

  # POST /consulta_procedimentos
  # POST /consulta_procedimentos.json
  def create
    @consulta_procedimento = ConsultaProcedimento.new(consulta_procedimento_params)
    respond_to do |format|
      if @consulta_procedimento.save
        if params[:consulta_procedimento][:adicionar_a_fatura]
          @consulta_procedimento.consulta.fatura.descritivo_fatura.create!(:descricao => @consulta_procedimento.procedimento.nome, :valor => @consulta_procedimento.valor, :clinica_id => session[:clinica_id])
        end
        format.html { redirect_to @consulta_procedimento, notice: 'Consulta procedimento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consulta_procedimento }
      else
        format.html { render action: 'new' }
        format.json { render json: @consulta_procedimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consulta_procedimentos/1
  # PATCH/PUT /consulta_procedimentos/1.json
  def update
    respond_to do |format|
      if @consulta_procedimento.update(consulta_procedimento_params)
        format.html { redirect_to @consulta_procedimento, notice: 'Consulta procedimento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consulta_procedimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consulta_procedimentos/1
  # DELETE /consulta_procedimentos/1.json
  def destroy
    @consulta_procedimento.destroy
    respond_to do |format|
      format.html { redirect_to consulta_procedimentos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta_procedimento
      @consulta_procedimento = ConsultaProcedimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consulta_procedimento_params
      params.require(:consulta_procedimento).permit(:clinica_id, :procedimento_id, :consulta_id, :valor).merge(clinica_id: session[:clinica_id])
    end
end
