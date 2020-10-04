class AziendasController < ApplicationController
  before_action :set_azienda, only: [:show, :edit, :update, :destroy]

  # GET /aziendas
  # GET /aziendas.json
  def index
    @aziendas = Azienda.all
  end

  # GET /aziendas/1
  # GET /aziendas/1.json
  def show
  end

  # GET /aziendas/new
  def new
    @azienda = Azienda.new
  end

  # GET /aziendas/1/edit
  def edit
  end

  # POST /aziendas
  # POST /aziendas.json
  def create
    @azienda = Azienda.new(azienda_params)

    respond_to do |format|
      if @azienda.save
        format.html { redirect_to @azienda, notice: 'Azienda was successfully created.' }
        format.json { render :show, status: :created, location: @azienda }
      else
        format.html { render :new }
        format.json { render json: @azienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aziendas/1
  # PATCH/PUT /aziendas/1.json
  def update
    respond_to do |format|
      if @azienda.update(azienda_params)
        format.html { redirect_to @azienda, notice: 'Azienda was successfully updated.' }
        format.json { render :show, status: :ok, location: @azienda }
      else
        format.html { render :edit }
        format.json { render json: @azienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aziendas/1
  # DELETE /aziendas/1.json
  def destroy
    @azienda.destroy
    respond_to do |format|
      format.html { redirect_to aziendas_url, notice: 'Azienda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_azienda
      @azienda = Azienda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def azienda_params
      params.require(:azienda).permit(:denominazione, :piva, :codfisc, :indirizzo, :cap, :citta, :tel, :fax, :cell, :email, :web, :pec, :referente, :note, :logo, :active)
    end
end
