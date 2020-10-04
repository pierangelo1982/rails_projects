class VehicleCardAcceptancesController < ApplicationController
  before_action :set_vehicle_card_acceptance, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_card_acceptances
  # GET /vehicle_card_acceptances.json
  def index
    @vehicle_card_acceptances = VehicleCardAcceptance.all
  end

  # GET /vehicle_card_acceptances/1
  # GET /vehicle_card_acceptances/1.json
  def show
  end

  # GET /vehicle_card_acceptances/new
  def new
    @vehicle_card_acceptance = VehicleCardAcceptance.new
    @vehicle_card_acceptance.spare_parts.build
  end

  # GET /vehicle_card_acceptances/1/edit
  def edit
  end

  # POST /vehicle_card_acceptances
  # POST /vehicle_card_acceptances.json
  def create
    @vehicle_card_acceptance = VehicleCardAcceptance.new(vehicle_card_acceptance_params)

    respond_to do |format|
      if @vehicle_card_acceptance.save
        format.html { redirect_to @vehicle_card_acceptance, notice: 'Vehicle card acceptance was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_card_acceptance }
      else
        format.html { render :new }
        format.json { render json: @vehicle_card_acceptance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_card_acceptances/1
  # PATCH/PUT /vehicle_card_acceptances/1.json
  def update
    respond_to do |format|
      if @vehicle_card_acceptance.update(vehicle_card_acceptance_params)
        format.html { redirect_to @vehicle_card_acceptance, notice: 'Vehicle card acceptance was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_card_acceptance }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_card_acceptance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_card_acceptances/1
  # DELETE /vehicle_card_acceptances/1.json
  def destroy
    @vehicle_card_acceptance.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_card_acceptances_url, notice: 'Vehicle card acceptance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_card_acceptance
      @vehicle_card_acceptance = VehicleCardAcceptance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_card_acceptance_params
      params.require(:vehicle_card_acceptance).permit(:date_vehicle_reception, :employee_id, :document_number, :address_book_id, :km, :serial_number, :vehicle_year, :vehicle_registered_in, :vehicle_model, :note,
        spare_parts_attributes: [:id, :product_id, :quantity, :unit_price, :discount, :total_price, :_destroy])
    end
end
