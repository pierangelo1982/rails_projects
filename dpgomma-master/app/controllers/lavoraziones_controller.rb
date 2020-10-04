class LavorazionesController < ApplicationController
  before_action :set_lavorazione, only: [:show, :edit, :update, :destroy]

  # GET /lavoraziones
  # GET /lavoraziones.json
  def index
    @lavoraziones = Lavorazione.all
  end

  # GET /lavoraziones/1
  # GET /lavoraziones/1.json
  def show
  end

  # GET /lavoraziones/new
  def new
    @lavorazione = Lavorazione.new
  end

  # GET /lavoraziones/1/edit
  def edit
  end

  # POST /lavoraziones
  # POST /lavoraziones.json
  def create
    @lavorazione = Lavorazione.new(lavorazione_params)

    respond_to do |format|
      if @lavorazione.save
        format.html { redirect_to @lavorazione, notice: 'Lavorazione was successfully created.' }
        format.json { render :show, status: :created, location: @lavorazione }
      else
        format.html { render :new }
        format.json { render json: @lavorazione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lavoraziones/1
  # PATCH/PUT /lavoraziones/1.json
  def update
    respond_to do |format|
      if @lavorazione.update(lavorazione_params)
        format.html { redirect_to @lavorazione, notice: 'Lavorazione was successfully updated.' }
        format.json { render :show, status: :ok, location: @lavorazione }
      else
        format.html { render :edit }
        format.json { render json: @lavorazione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lavoraziones/1
  # DELETE /lavoraziones/1.json
  def destroy
    @lavorazione.destroy
    respond_to do |format|
      format.html { redirect_to lavoraziones_url, notice: 'Lavorazione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lavorazione
      @lavorazione = Lavorazione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lavorazione_params
      params.require(:lavorazione).permit(:pezzo_id, :codice, :titolo, :descrizione, :prezzo, :sconto)
    end
end
