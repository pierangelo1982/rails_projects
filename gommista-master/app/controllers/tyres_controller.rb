class TyresController < ApplicationController
  before_action :set_tyre, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout "application2"

  # GET /tyres
  # GET /tyres.json
  def index
    @tyres = Tyre.all
  end

  # GET /tyres/1
  # GET /tyres/1.json
  def show
  end

  # GET /tyres/new
  def new
    @tyre = Tyre.new
  end

  # GET /tyres/1/edit
  def edit
  @tyrex = Tyre.find(params[:id])
  end

  # POST /tyres
  # POST /tyres.json
  def create
    @tyre = Tyre.new(tyre_params)
    respond_to do |format|
      if @tyre.save
        format.html { redirect_to (:back), notice: 'Treno pneumatici inserito.' }
        format.json { render json: @tyre, status: :created, location: @tyre, content_type: 'text/json' }
      else
        format.html { render action: 'new' }
        format.json { render json: @tyre.errors, status: :unprocessable_entity }
      end
    end
  end


def submitdeposito
    @tyrex = Tyre.find(params[:id])
    @tyrex.update_attributes(deposito: true)
    redirect_to :back, notice: 'Treno Penumatici inseriti in nostro deposito.'
end
def submitinstallation
    @tyrex = Tyre.find(params[:id])
    @tyrex.update_attributes(deposito: false)
    redirect_to :back, notice: 'Treno Pneumatici installati sul veicolo.'
end
def submitusurata
    @tyrex = Tyre.find(params[:id])
    @tyrex.update_attributes(status: false)
    redirect_to :back, notice: 'Treno di Gomme disattivato.'
end
def submitusuratariattiva
    @tyrex = Tyre.find(params[:id])
    @tyrex.update_attributes(status: true)
    redirect_to :back, notice: 'Treno di Gomme disattivato.'
end

  # PATCH/PUT /tyres/1
  # PATCH/PUT /tyres/1.json
  def update
    respond_to do |format|
      if @tyre.update(tyre_params)
        format.html { redirect_to @tyre, notice: 'Tyre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tyre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tyres/1
  # DELETE /tyres/1.json
  def destroy
    @tyre.destroy
    respond_to do |format|
      format.html { redirect_to tyres_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tyre
      @tyre = Tyre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tyre_params
      params.require(:tyre).permit(:car_id, :marca, :modello, :tipologia, :consegna, :ritiro, :km, :usura, :location_id, :shelf_id, :block_id, :floor_id, :column_id, :created, :modified, :kit, :deposito, :status)
    end
end
