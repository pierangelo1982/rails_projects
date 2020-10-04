class CustumersController < ApplicationController
  before_action :set_custumer, only: [:show, :edit, :update, :destroy]

  # GET /custumers
  # GET /custumers.json
  def index
    @custumers = Custumer.all
  end

  # GET /custumers/1
  # GET /custumers/1.json
  def show
  end

  # GET /custumers/new
  def new
    @custumer = Custumer.new
    @custumer.custumer_banks.build
    @custumer.build_address
  end

  # GET /custumers/1/edit
  def edit
  end

  # POST /custumers
  # POST /custumers.json
  def create
    @custumer = Custumer.new(custumer_params)

    respond_to do |format|
      if @custumer.save
        format.html { redirect_to @custumer, notice: 'Custumer was successfully created.' }
        format.json { render :show, status: :created, location: @custumer }
      else
        format.html { render :new }
        format.json { render json: @custumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custumers/1
  # PATCH/PUT /custumers/1.json
  def update
    respond_to do |format|
      if @custumer.update(custumer_params)
        format.html { redirect_to @custumer, notice: 'Custumer was successfully updated.' }
        format.json { render :show, status: :ok, location: @custumer }
      else
        format.html { render :edit }
        format.json { render json: @custumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custumers/1
  # DELETE /custumers/1.json
  def destroy
    @custumer.destroy
    respond_to do |format|
      format.html { redirect_to custumers_url, notice: 'Custumer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custumer
      @custumer = Custumer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custumer_params
      params.require(:custumer).permit(:denominazione, :piva, :codfisc, :indirizzo, :cap, :citta, :provincia, :telefono, :fax, :cellulare, :email, :web, :note,
      address_attributes: [:id, :custumer_id, :via, :cap, :citta, :provincia, :_destroy],
      custumer_banks_attributes: [:id, :custumer_id, :banca, :abi, :cab, :numero_conto, :iban, :_destroy])
    end
end
