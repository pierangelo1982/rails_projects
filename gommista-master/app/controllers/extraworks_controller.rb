class ExtraworksController < ApplicationController
  before_action :set_extrawork, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /extraworks
  # GET /extraworks.json
  def index
    #@extraworks = Extrawork.all
    @extralavoroworks = Extralavorowork.all
    @extraworks = Extrawork.includes(:car).where(nil) # creates an anonymous scope
    @extraworks = Extrawork.includes(:car).where("cars.targa=?", session['ciao']) if session['ciao'].present?
  end

  # GET /extraworks/1
  # GET /extraworks/1.json
  def show
  end

  def stampaextrawork
    #render layout: false
    Extrawork.find(params[:id])
    @extrawork = Extrawork.find(params[:id])
    #Prawn::Document.generate("app/assets/pdf2/#{@car.targa}.pdf")  do |f|
    Prawn::Document.new(:landscape => [100000, 200000])
  end

  # GET /extraworks/new
  def new
    @extrawork = Extrawork.new
    @extrawork.extralavoroworks.build
    @extrawork.scriviworks.build

  end

  # GET /extraworks/1/edit
  def edit
  end

  # POST /extraworks
  # POST /extraworks.json
  def create
    @extrawork = Extrawork.new(extrawork_params)

    respond_to do |format|
      if @extrawork.save
        format.html { redirect_to @extrawork, notice: 'Extrawork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @extrawork }
      else
        format.html { render action: 'new' }
        format.json { render json: @extrawork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extraworks/1
  # PATCH/PUT /extraworks/1.json
  def update
    respond_to do |format|
      if @extrawork.update(extrawork_params)
        format.html { redirect_to @extrawork, notice: 'Extrawork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @extrawork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extraworks/1
  # DELETE /extraworks/1.json
  def destroy
    @extrawork.destroy
    respond_to do |format|
      format.html { redirect_to extraworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extrawork
      @extrawork = Extrawork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extrawork_params
      params.require(:extrawork).permit(:car_id, :note, :tempo, :prezzo, :data, :km, :descrizione,
        extralavoroworks_attributes:[:id, :extrawork_id, :lavoro, :descrizione, :quantita, :importo, :codice, :catextrawork_id, :_destroy],
        scriviworks_attributes:[:id, :extrawork_id, :descrizione, :codice, :quantita, :importo, :_destroy])
    end
end
