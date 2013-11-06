# -*- encoding : utf-8 -*-
#encoding: utf-8
class ConsultasController < ApplicationController
  include ApplicationHelper
  before_action :set_consulta, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?

  # GET /consultas
  # GET /consultas.json
  def index
    unless params[:search].try(:nil) || params[:search].try(:blank?)
        @consultas = Consulta.where(:clinica_id => session[:clinica_id]).joins(:paciente).where("pacientes.nome like ? AND pacientes.clinica_id = ?", "%#{params[:search]}%", "#{session[:clinica_id]}").order("created_at DESC").page(params[:page]).per(8)
    else
        @consultas = Consulta.where(:clinica_id => session[:clinica_id]).order("created_at DESC").page(params[:page]).per(8)
    end
    @consulta = Consulta.new
    @consultasxml = Consulta.where(:clinica_id => session[:clinica_id])
    respond_to do |format|
        format.xml {render :xml => @consultasxml.to_xml(:include => :paciente) }
        format.json {render :json => @consultas}
        format.html {render :html => @consultas}
    end
  end

  # GET /consultas/1
  # GET /consultas/1.json
  def show
    if @consulta.nil?
      redirect_to consultas_path, :alert => "Consulta não encontrada!"
    end
  end

  # GET /consultas/new
  def new
    @consulta = Consulta.new
  end

  # GET /consultas/1/edit
  def edit
    if @consulta.nil?
      redirect_to consultas_path, :alert => "Consulta não encontrada!"
    end
  end

  # POST /consultas
  # POST /consultas.json
  def create
    @consulta = Consulta.new(consulta_params)
    respond_to do |format|
      if @consulta.save
        if @consulta.fatura.nil?
          @fatura   = Fatura.create!(:consulta_id => @consulta.id, :descricao => "Cobrança do paciente #{@consulta.paciente.nome}", :clinica_id => session[:clinica_id])
        end
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

  def calendario_dentista
    @consultas = Consulta.where(:dentista_id => params[:id])
    respond_to do |format|
      format.xml {render :xml => @consultas}
      format.json {render :json => @consultas}
      format.html {render :html => @consultas}
    end
  end

  def confirmar_consulta
    @consulta = Consulta.find(params[:consulta_id])
    @consulta.update_attribute(:status, "Confirmado")
    respond_to do |format|
      format.html { redirect_to consultas_path, notice: "Consulta do paciente #{@consulta.paciente.nome} na data #{@consulta.data} confirmada" } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_consulta
      @consulta = Consulta.where("id = ? AND clinica_id = ?", params[:id], session[:clinica_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consulta_params
      params.require(:consulta).permit(:data, :hora_inicio, :hora_fim, :tipo, :procedimento_id, :paciente_id, :convenio_id, :dentista_id, :observacao, :status).merge(clinica_id: session[:clinica_id])
    end


end
