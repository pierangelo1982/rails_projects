class PezzosController < ApplicationController
  before_action :set_pezzo, only: [:show, :edit, :update, :destroy]

  # GET /pezzos
  # GET /pezzos.json
  def index
    @pezzos = Pezzo.all
  end

  # GET /pezzos/1
  # GET /pezzos/1.json
  def show
  end

  # GET /pezzos/new
  def new
    @pezzo = Pezzo.new
    @pezzo.lavoraziones.build
  end

  # GET /pezzos/1/edit
  def edit
  end

  # POST /pezzos
  # POST /pezzos.json
  def create
    @pezzo = Pezzo.new(pezzo_params)

    respond_to do |format|
      if @pezzo.save
        format.html { redirect_to @pezzo, notice: 'Pezzo was successfully created.' }
        format.json { render :show, status: :created, location: @pezzo }
      else
        format.html { render :new }
        format.json { render json: @pezzo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pezzos/1
  # PATCH/PUT /pezzos/1.json
  def update
    respond_to do |format|
      if @pezzo.update(pezzo_params)
        format.html { redirect_to @pezzo, notice: 'Pezzo was successfully updated.' }
        format.json { render :show, status: :ok, location: @pezzo }
      else
        format.html { render :edit }
        format.json { render json: @pezzo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pezzos/1
  # DELETE /pezzos/1.json
  def destroy
    @pezzo.destroy
    respond_to do |format|
      format.html { redirect_to pezzos_url, notice: 'Pezzo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pezzo
      @pezzo = Pezzo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pezzo_params
      params.require(:pezzo).permit(:azienda_id, :codice, :nome, :descrizione, :note, :prezzo, :immagine, :scheda_tecnica,
        lavoraziones_attributes: [:id, :pezzo_id, :codice, :titolo, :descrizione, :prezzo, :sconto, :_destroy])
    end
end
