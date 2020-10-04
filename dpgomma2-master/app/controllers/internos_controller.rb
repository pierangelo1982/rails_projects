class InternosController < ApplicationController
  before_action :set_interno, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @internos = Interno.all
    respond_with(@internos)
  end

  def show
    respond_with(@interno)
  end

  def new
    @interno = Interno.new
    @entradatum = Entratadatum.all
    @exitdatum = Exitdatum.all
    @interno.internodata.build
    respond_with(@interno)
  end

  def edit
  end

  def create
    @interno = Interno.new(interno_params)
    @interno.save
    respond_with(@interno)
  end

  def update
    @interno.update(interno_params)
    respond_with(@interno)
  end

  def destroy
    @interno.destroy
    respond_with(@interno)
  end

  private
    def set_interno
      @interno = Interno.find(params[:id])
    end

    def interno_params
      params.require(:interno).permit(:azienda_id, :operatore_id, :data, :riconsegnato, :rif_ddt, :note, :trasporto, :colli, :aspetto, :note,
        internodata_attributes: [:id, :interno_id, :descrizione, :lavorazione_id, :quantita, :_destroy])
    end
end
