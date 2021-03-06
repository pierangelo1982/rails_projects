class ExitsController < ApplicationController
  before_action :set_exit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /exits
  # GET /exits.json
  def index
    #@exits = Exit.all
    @tasks_grid = initialize_grid(Exit, per_page: 30)
    @exits = Exit.where(nil) # creates an anonymous scope
    @exits = Exit.where('extract(year  from data)=?', params[:annuale]) if params[:annuale].present?
  end

  # GET /exits/1
  # GET /exits/1.json
  def show
  end

  def pdf
    @exit = Exit.find(params[:id])
    Prawn::Document.new(:landscape => [100000, 200000])
  end

  # GET /exits/new
  def new
    @azie = Azienda.where('id=?', params[:temp_azienda]).first
    @exit = Exit.new
    @exit.exitdata.build
    @ciao = Entratadatum.all
    @entrata = Entratum.all
    @entradatum = Entratadatum.all
    @exitdatum = Exitdatum.all
  end

  # GET /exits/1/edit
  def edit
  end

  # POST /exits
  # POST /exits.json
  def create
    @exit = Exit.new(exit_params)

    respond_to do |format|
      if @exit.save
        format.html { redirect_to @exit, notice: 'Exit was successfully created.' }
        format.json { render :show, status: :created, location: @exit }
      else
        format.html { render :new }
        format.json { render json: @exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exits/1
  # PATCH/PUT /exits/1.json
  def update
    respond_to do |format|
      if @exit.update(exit_params)
        format.html { redirect_to @exit, notice: 'Exit was successfully updated.' }
        format.json { render :show, status: :ok, location: @exit }
      else
        format.html { render :edit }
        format.json { render json: @exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exits/1
  # DELETE /exits/1.json
  def destroy
    @exit.destroy
    respond_to do |format|
      format.html { redirect_to exits_url, notice: 'Exit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit
      @exit = Exit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_params
      params.require(:exit).permit(:azienda_id, :data, :numero, { entratum_ids:[] }, :colli, :quantita, :scarti, :netto, :tax, :totale, :note, :tipo_trasporto, :aspetto, :responsabile_trasporto, :altro, :consegnato, :pesotot,
        exitdata_attributes: [:id, :exit_id, :quantita, :pezzo_id, :lavorazione_id, :descrizione, :peso, :exitdatumtotale, :exitdatumtotaleiva, :exitdatumtotaleivato, :reso, :costoreso, :inscatolamentoprezzo, :_destroy])
    end
end
