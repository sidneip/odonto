class ConveniosController < ApplicationController
  before_action :set_convenio, only: [:show, :edit, :update, :destroy]

  # GET /convenios
  # GET /convenios.json
  def index
    @convenios = Convenio.all
  end

  # GET /convenios/1
  # GET /convenios/1.json
  def show
  end

  # GET /convenios/new
  def new
    @convenio = Convenio.new
  end

  # GET /convenios/1/edit
  def edit
  end

  # POST /convenios
  # POST /convenios.json
  def create
    @convenio = Convenio.new(convenio_params)

    respond_to do |format|
      if @convenio.save
        format.html { redirect_to @convenio, notice: 'Convenio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @convenio }
      else
        format.html { render action: 'new' }
        format.json { render json: @convenio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /convenios/1
  # PATCH/PUT /convenios/1.json
  def update
    respond_to do |format|
      if @convenio.update(convenio_params)
        format.html { redirect_to @convenio, notice: 'Convenio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @convenio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convenios/1
  # DELETE /convenios/1.json
  def destroy
    @convenio.destroy
    respond_to do |format|
      format.html { redirect_to convenios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convenio
      @convenio = Convenio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convenio_params
      params.require(:convenio).permit(:codigo_convenio, :cnpj, :razao_social, :nome_fantasia, :logradouro, :numero, :bairro, :complemento, :cep, :uf, :cidade, :telefone, :fax, :email)
    end
end
