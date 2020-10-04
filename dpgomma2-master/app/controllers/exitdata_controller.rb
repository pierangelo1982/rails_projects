class ExitdataController < ApplicationController
  before_action :set_exitdatum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @exitdata = Exitdatum.all
    respond_with(@exitdata)
  end

  def show
    respond_with(@exitdatum)
  end

  def new
    @exitdatum = Exitdatum.new
    respond_with(@exitdatum)
  end

  def edit
  end

  def create
    @exitdatum = Exitdatum.new(exitdatum_params)
    @exitdatum.save
    respond_with(@exitdatum)
  end

  def update
    @exitdatum.update(exitdatum_params)
    respond_with(@exitdatum)
  end

  def destroy
    @exitdatum.destroy
    respond_with(@exitdatum)
  end

  private
    def set_exitdatum
      @exitdatum = Exitdatum.find(params[:id])
    end

    def exitdatum_params
      params.require(:exitdatum).permit(:azienda_id, :quantita, :pezzo_id, :lavorazione_id, :descrizione, :exitdatumtotale, :exitdatumtotaleiva, :exitdatumtotaleivato, :reso, :costoreso, :inscatolamentoprezzo)
    end
end
