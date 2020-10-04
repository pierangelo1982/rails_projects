class EntrataController < ApplicationController
  before_action :set_entratum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /entrata
  # GET /entrata.json
  def index
    @entrata = Entratum.all
    @tasks_grid = initialize_grid(Entratum, per_page: 30)

    #@exits = Exit.all
    #@invoices = Invoice.all
    #@entratainlavorazioneoff = Entratum.where('inlavorazione=?', false)
    #@entratainlavorazioneon = Entratum.where('inlavorazione=?', true)
    #@entratainlavorazionechiuso = Entratum.where('chiuso=?', true)
  end

  # GET /entrata/1
  # GET /entrata/1.json
  def show
  end

  # GET /entrata/new
  def new
    @entratum = Entratum.new
    @ciao = Azienda.where('id=?', params[:temp_azienda])
    @entratum.entratadata.build
    @lavorazio = Lavorazione.all

  end

  # GET /entrata/1/edit
  def edit
  end

  # POST /entrata
  # POST /entrata.json
  def create
    @entratum = Entratum.new(entratum_params)

    respond_to do |format|
      if @entratum.save
        format.html { redirect_to @entratum, notice: 'Entratum was successfully created.' }
        format.json { render :show, status: :created, location: @entratum }
      else
        format.html { render :new }
        format.json { render json: @entratum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrata/1
  # PATCH/PUT /entrata/1.json
  def update
    respond_to do |format|
      if @entratum.update(entratum_params)
        format.html { redirect_to @entratum, notice: 'Entratum was successfully updated.' }
        format.json { render :show, status: :ok, location: @entratum }
      else
        format.html { render :edit }
        format.json { render json: @entratum.errors, status: :unprocessable_entity }
      end
    end
  end

  def submittop
    @entratax = Entratum.find(params[:id])
    @entratax.update_attributes(riserva: false)
    redirect_to :back, notice: 'Merce Ricevuta senza Riserve'
  end

  def submitdown
    @entratax = Entratum.find(params[:id])
    @entratax.update_attributes(riserva: true)
    redirect_to :back, notice: 'Merce ricevuta con Riserva'
  end

  def inlavorazioneon
    @entratax = Entratum.find(params[:id])
    @entratax.update_attributes(inlavorazione: true)
    redirect_to :back, notice: 'Merce in lavorazione'
  end

  def inlavorazioneoff
    @entratax = Entratum.find(params[:id])
    @entratax.update_attributes(inlavorazione: false)
    redirect_to :back, notice: 'Merce tolta da Lavorazione'
  end

  def chiusoon
    @entratax = Entratum.find(params[:id])
    @entratax.update_attributes(chiuso: true)
    redirect_to :back, notice: 'Lavorazione Ultimata'
  end

  def chiusooff
    @entratax = Entratum.find(params[:id])
    @entratax.update_attributes(chiuso: false)
    redirect_to :back, notice: 'Lavorazione Ripristinata'
  end

  # DELETE /entrata/1
  # DELETE /entrata/1.json
  def destroy
    @entratum.destroy
    respond_to do |format|
      format.html { redirect_to entrata_url, notice: 'Entratum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entratum
      @entratum = Entratum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entratum_params
      params.require(:entratum).permit(:azienda_id, :importaddt, :numero, :data, :data_ricezione, :consegnato_da, :imballo, :colli, :riserva, :note, :inlavorazione, :chiuso, :riconsegnato, :fatturato, :pagato, :pezzi_ricevuti, :pezzi_scartati, :entrata_netto,
        entratadata_attributes: [:id, :entrata_id, :pezzo_id, :lavorazione_id, :note, :quantita, :colli, :peso, :entratadatumtotale, :entratumtotaleivato, :entratumtotaleiva, :_destroy])
    end
end
