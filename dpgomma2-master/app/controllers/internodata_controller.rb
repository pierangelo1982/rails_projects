class InternodataController < ApplicationController
  before_action :set_internodatum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @internodata = Internodatum.all
    respond_with(@internodata)
  end

  def show
    respond_with(@internodatum)
  end

  def new
    @internodatum = Internodatum.new
    respond_with(@internodatum)
  end

  def edit
  end

  def create
    @internodatum = Internodatum.new(internodatum_params)
    @internodatum.save
    respond_with(@internodatum)
  end

  def update
    @internodatum.update(internodatum_params)
    respond_with(@internodatum)
  end

  def destroy
    @internodatum.destroy
    respond_with(@internodatum)
  end

  private
    def set_internodatum
      @internodatum = Internodatum.find(params[:id])
    end

    def internodatum_params
      params.require(:internodatum).permit(:interno_id, :descrizione, :lavorazione_id, :quantita)
    end
end
