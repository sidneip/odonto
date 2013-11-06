# -*- encoding : utf-8 -*-
class DentistasController < ApplicationController
  before_action :set_dentista, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?

  # GET /dentistas
  # GET /dentistas.json
  def index
    @dentistas = Dentista.where(:clinica_id => session[:clinica_id])
    respond_to do |format|
        format.xml {render :xml => @dentistas}
        format.json {render :json => @dentistas}
        format.html {render :html => @dentistas}
    end
  end

  # GET /dentistas/1
  # GET /dentistas/1.json
  def show
    if @dentista.nil?
      redirect_to dentistas_path, alert: 'dentista não encontrado'
    end
  end

  # GET /dentistas/new
  def new
    @dentista = Dentista.new
  end

  # GET /dentistas/1/edit
  def edit
    if @dentista.nil?
      redirect_to dentistas_path, alert: 'dentista não encontrado'
    end
  end

  # POST /dentistas
  # POST /dentistas.json
  def create
    @dentista = Dentista.new(dentista_params)

    respond_to do |format|
      if @dentista.save
        format.html { redirect_to @dentista, notice: 'Dentista was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dentista }
      else
        format.html { render action: 'new' }
        format.json { render json: @dentista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dentistas/1
  # PATCH/PUT /dentistas/1.json
  def update
    respond_to do |format|
      if @dentista.update(dentista_params)
        format.html { redirect_to @dentista, notice: 'Dentista was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dentista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dentistas/1
  # DELETE /dentistas/1.json
  def destroy
    @dentista.destroy
    respond_to do |format|
      format.html { redirect_to dentistas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dentista
      @dentista = Dentista.where("id = ? AND clinica_id = ?", params[:id], session[:clinica_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dentista_params
      params.require(:dentista).permit(:nome, :email, :password, :sexo, :data_nasc, :estado_civil, :cep, :rua, :numero, :bairro, :cidade, :uf, :complemento, :telefone, :celular, :identidade_rg, :orgao_rg, :cpf, :cro).merge(clinica_id: session[:clinica_id])
    end
end
