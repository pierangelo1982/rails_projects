class EntratadataController < ApplicationController
  before_action :set_entratadatum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /entratadata
  # GET /entratadata.json
  def index
    @entratadata = Entratadatum.all
  end

  # GET /entratadata/1
  # GET /entratadata/1.json
  def show
  end

  # GET /entratadata/new
  def new
    @entratadatum = Entratadatum.new
  end

  # GET /entratadata/1/edit
  def edit
  end

  # POST /entratadata
  # POST /entratadata.json
  def create
    @entratadatum = Entratadatum.new(entratadatum_params)

    respond_to do |format|
      if @entratadatum.save
        format.html { redirect_to @entratadatum, notice: 'Entratadatum was successfully created.' }
        format.json { render :show, status: :created, location: @entratadatum }
      else
        format.html { render :new }
        format.json { render json: @entratadatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entratadata/1
  # PATCH/PUT /entratadata/1.json
  def update
    respond_to do |format|
      if @entratadatum.update(entratadatum_params)
        format.html { redirect_to @entratadatum, notice: 'Entratadatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @entratadatum }
      else
        format.html { render :edit }
        format.json { render json: @entratadatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entratadata/1
  # DELETE /entratadata/1.json
  def destroy
    @entratadatum.destroy
    respond_to do |format|
      format.html { redirect_to entratadata_url, notice: 'Entratadatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entratadatum
      @entratadatum = Entratadatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entratadatum_params
      params.require(:entratadatum).permit(:entrata_id, :pezzo_id, :lavorazione_id, :note, :quantita, :colli, :peso, :entradatumtotale, :entratumtotaleivato, :entratumtotaleiva)
    end
end
