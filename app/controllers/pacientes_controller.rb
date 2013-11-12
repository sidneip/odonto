# -*- encoding : utf-8 -*-
class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?
  # GET /pacientes
  # GET /pacientes.json
  def index
    @pacientes = Paciente.where(:clinica_id => session[:clinica_id])
    respond_to do |format|
        format.html 
        format.xml {render :xml => @pacientes}
        format.json {render :json => @pacientes}
    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
    if @paciente.nil?
      redirect_to pacientes_path, alert: 'paciente não encontrado'
    end
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
  end

  def atestado
  end

  # GET /pacientes/1/edit
  def edit
    if @paciente.nil?
      redirect_to pacientes_path, alert: 'paciente não encontrado'
    end
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: 'Paciente was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paciente }
      else
        format.html { render action: 'new' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.where("id = ? AND clinica_id = ?", params[:id], session[:clinica_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:nome, :sexo, :data_nascimento, :estado_civil, :nacionalidade, :nome_mae, :cep, :rua, :numero, :bairro, :cidade, :uf, :complemento, :telefone, :celular, :id, :email, :identidade_rg, :orgao_rg, :cpf).merge(clinica_id: session[:clinica_id])
    end
end
