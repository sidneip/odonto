# -*- encoding : utf-8 -*-
#encoding: utf-8
class ProcedimentosController < ApplicationController
  before_action :set_procedimento, only: [:show, :edit, :update, :destroy]
  before_action :is_logged?

  # GET /procedimentos
  # GET /procedimentos.json
  def index
    @procedimentos = Procedimento.where(:clinica_id => session[:clinica_id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @procedimentos}
    end
  end

  # GET /procedimentos/1
  # GET /procedimentos/1.json
  def show
    if @procedimento.nil?
      redirect_to procedimentos_path, alert: 'procedimento não encontrado'
    end
  end

  # GET /procedimentos/new
  def new
    @procedimento = Procedimento.new
  end

  # GET /procedimentos/1/edit
  def edit
    if @procedimento.nil?
      redirect_to procedimentos_path, alert: 'procedimento não encontrado'
    end
  end

  # POST /procedimentos
  # POST /procedimentos.json
  def create
    @procedimento = Procedimento.new(procedimento_params)
    respond_to do |format|
      if @procedimento.save
        format.html { redirect_to @procedimento, notice: 'Procedimento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @procedimento }
      else
        format.html { render action: 'new', notice: "algo errado" }
        format.json { render json: @procedimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedimentos/1
  # PATCH/PUT /procedimentos/1.json
  def update
    respond_to do |format|
      if @procedimento.update(procedimento_params)
        format.html { redirect_to @procedimento, notice: 'Procedimento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @procedimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedimentos/1
  # DELETE /procedimentos/1.json
  def destroy
    @procedimento.destroy
    respond_to do |format|
      format.html { redirect_to procedimentos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedimento
      @procedimento = Procedimento.where("id = ? AND clinica_id = ?", params[:id], session[:clinica_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procedimento_params
      params.require(:procedimento).permit(:nome, :tipo, :valor, :custo).merge(clinica_id: session[:clinica_id])
    end
end
